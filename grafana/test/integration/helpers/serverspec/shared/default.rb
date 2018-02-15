shared_examples 'default' do
  describe file('/usr/sbin/grafana-server') do
    it { should be_a_file }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file("/etc/#{sys_dir}/grafana-server") do
    it { should be_a_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/grafana/grafana.ini') do
    it { should be_a_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'grafana' }
  end

  describe service('grafana-server') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/nginx/sites-enabled/grafana') do
    it { should be_file }
    it { should be_linked_to '/etc/nginx/sites-available/grafana' }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /server 127.0.0.1:3000;/ }
    its(:content) { should match %r{proxy_pass http://grafana;} }
  end

  describe command('curl http://127.0.0.1:3000/') do
    its(:stdout) { should match %r{<a href="/login">Found</a>} }
  end

  describe command('curl http://127.0.0.1/') do
    its(:stdout) { should match %r{<a href="/login">Found</a>} }
  end
end
