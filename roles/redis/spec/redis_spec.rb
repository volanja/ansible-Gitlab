require 'spec_helper'

describe service('redis') do
  it { should be_enabled   }
  it { should be_running   }
end

## network
describe file('/var/run/redis/redis.sock') do
  it { should be_socket }
  it { should be_mode 707 }
end
