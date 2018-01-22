# Author:: Greg Fitzgerald (greg@gregf.org)
# # Copyright:: Copyright (c) 2013 Greg Fitzgerald
# License:: Apache License, Version 2.0
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

default['apticron']['config_file'] = '/etc/apticron/apticron.conf'
default['apticron']['package'] = 'apticron'

default['apticron']['email'] = 'root'
default['apticron']['diff_only'] = '1'
default['apticron']['listchanges_profile'] = 'apticron'
default['apticron']['all_fqdns'] = '1'
default['apticron']['system'] = node['fqdn']
default['apticron']['ipaddressnum'] = '1'
default['apticron']['ipaddresses'] = nil
default['apticron']['notify_holds'] = '0'
default['apticron']['notify_new'] = '0'
default['apticron']['notify_no_updates'] = '0'
default['apticron']['custom_subject'] = nil
default['apticron']['custom_no_updates_subject'] = nil
default['apticron']['custom_from'] = nil
