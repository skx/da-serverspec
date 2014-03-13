require 'spec_helper'


describe service('mysql') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(3306) do
  it { should be_listening }
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
