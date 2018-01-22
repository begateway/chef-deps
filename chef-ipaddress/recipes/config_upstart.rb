# the recipe fixes broken upstart script of networking in 14.04
# see https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/1301015

if node['platform'] == 'ubuntu'
  if node["platform_version"].to_f == 14.04

    cookbook_file "/etc/init/networking.conf" do
      source "networking.conf"
      mode 0644
      owner 'root'
      group 'root'
    end

    cookbook_file "/etc/init.d/networking" do
      source "networking"
      mode 0755
      owner 'root'
      group 'root'
    end
  end
end
