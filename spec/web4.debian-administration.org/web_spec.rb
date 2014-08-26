require 'spec_helper'

#
#  Apache listens on 8080
#
describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled   }
  it { should be_running   }
end
describe port(8080) do
  it { should be_listening }
end

describe file('/etc/apache2/sites-enabled/yawns') do
  it { should be_file }
  its(:content) { should match /ServerName www.debian-administration.org/ }
end

#
#  We should have an IP in the right vlan.
#
describe interface('eth0') do
  it { should have_ipv4_address("212.110.179.70") }
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


#
#  HaProxy should run on :80
#
describe service('haproxy') do
  it { should be_enabled   }
  it { should be_running   }
end
describe file('/etc/haproxy/haproxy.cfg') do
  it { should be_file }
  its(:content) { should match /:80/ }
  its(:content) { should match /:443/ }
end
describe port(80) do
  it { should be_listening }
end
describe port(443) do
  it { should be_listening }
end
