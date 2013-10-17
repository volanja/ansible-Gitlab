require 'spec_helper'

describe service('gitlab') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8080) do
  it { should be_listening }
end

describe file('/etc/nginx/conf.d/gitlab.conf') do
  it { should be_file }
end
