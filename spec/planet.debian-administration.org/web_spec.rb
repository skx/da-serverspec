require 'spec_helper'

#
#  nginx listens on 80
#
describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end
describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/sites-enabled/planet') do
  it { should be_file }
  its(:content) { should match /server_name\s+planet.debian-administration.org/ }
end

#
#  We should have an IP in the right vlan.
#
describe interface('eth0') do
  it { should have_ipv4_address("212.110.179.68") }
end
describe default_gateway do
  its(:ipaddress) { should eq '212.110.179.65' }
end




#
#  SSH testing, which runs on :2222
#
describe service('ssh') do
  it { should be_enabled   }
  it { should be_running   }
end
describe file('/etc/ssh/sshd_config') do
  it { should be_file }
  its(:content) { should match /Port\s+2222/ }
end
describe port(2222) do
  it { should be_listening }
end
