# Cookbook Name:: netdata
# Specs:: spec_helper
#
# Copyright 2016, Abiquo
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

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'
  config.formatter = 'documentation'
  config.order = 'random'
  config.color = true
  config.fail_fast = true
end

# silence!!
#
# all logging
Chef::Log.init('/dev/null')
#
# 'warning: already initialized constant'
$VERBOSE = nil
#
# deprecation warnings
module Kernel
  def deprecated(*)
    # noop
  end
end

ChefSpec::Coverage.start!
