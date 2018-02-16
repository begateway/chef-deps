name             'golang'
source_url       'https://github.com/NOX73/chef-golang'
issues_url       'https://github.com/NOX73/chef-golang/issues'
maintainer       'Alexander Rozhnov'
maintainer_email 'gnox73@gmail.com'
license          'Apache 2.0'
description      'Installs go programming language'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.7.1'

recipe "golang", "Installs go programing language."
recipe "golang::packages", "Installs go packages and SCM requirements."

supports 'debian'
supports 'ubuntu'
supports 'centos'
