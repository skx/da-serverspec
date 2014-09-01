require 'spec_helper'


#
#  Apache listens on :8080, with haproxy on :443 + :80
#
#  So both services should be installed, enabled, and running.
#
%w( apache2 haproxy ).each do |pkg|

  describe package(pkg) do
    it { should be_installed }
  end

  describe service(pkg) do
    it { should be_enabled   }
    it { should be_running   }
  end

end


#
# The end-result should be three listening ports: 80, 443, 8080.
#
%w( 80 443 8080 ).each do |prt|
  describe port(prt) do
    it { should be_listening }
  end
end



#
#  Test the config files are OK.
#
describe file('/etc/apache2/sites-enabled/yawns') do
  it { should be_file }
  its(:content) { should match /ServerName www.debian-administration.org/ }
end

describe file('/etc/haproxy/haproxy.cfg') do
  it { should be_file }
  its(:content) { should match /:80/ }
  its(:content) { should match /:443/ }
end

#
#  We should have an IP in the right vlan.
#
describe interface('eth0') do
  it { should have_ipv4_address("212.110.179.75") }
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

