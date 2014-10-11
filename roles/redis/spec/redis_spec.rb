require 'spec_helper'

describe package('redis') do
  it { should be_installed }
end

describe service('redis') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/etc/redis.conf') do
  it { should be_file }
  it { should contain "bind 127.0.0.1" }
end

## network
describe file('/var/run/redis/redis.sock') do
  it { should be_socket }
  it { should be_mode 707 }
end
