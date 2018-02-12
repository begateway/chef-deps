# Cookbook Name:: netdata
# Specs:: netdata_python_plugin_spec
#
# Copyright 2017, Nick Willever
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'netdata_test::default' do
  context 'netdata_python_plugin custom mysql configuration' do
    cached(:chef_run) do
      runner = ChefSpec::SoloRunner.new(step_into: ['netdata_python_plugin'])
      runner.converge(described_recipe)
    end

    it 'configures netdata_python_plugin' do
      expect(chef_run).to create_netdata_python_plugin('mysql')
        .with(global_configuration: { 'retries' => 5 },
              jobs: { 'tcp' => { 'name' => 'local', 'host' => 'localhost', 'port' => 3306 } })
    end

    it 'creates mysql python.d plugin configuration file' do
      expect(chef_run).to create_template('/etc/netdata/python.d/mysql.conf')
    end

    it 'creates mysql configuration file with custom jobs' do
      expect(chef_run).to render_file('/etc/netdata/python.d/mysql.conf')
        .with_content(/tcp:.*name:\slocal.*host:\slocalhost.*port:\s3306/m)
    end

    it 'creates mysql configuration file with custom global configuration' do
      expect(chef_run).to render_file('/etc/netdata/python.d/mysql.conf')
        .with_content(/retries:\s5/)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
