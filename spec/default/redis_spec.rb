require 'spec_helper'

describe package('redis') do
  it { should be_installed }
end

describe service('redis') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(6379) do
  it { should be_listening }
end

describe file('/etc/redis.conf') do
  it { should be_file }
  it { should contain "bind 127.0.0.1" }
end
