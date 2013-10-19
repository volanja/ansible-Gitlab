require 'spec_helper'

describe file('/home/git/gitlab') do
  it { should be_directory }
end

describe file('/home/git/gitlab-shell') do
  it { should be_directory }
end

describe file('/home/git/gitlab-satellites') do
  it { should be_directory }
end

describe file('/home/git/repositories') do
  it { should be_directory }
end

describe service('gitlab') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/home/git/gitlab/tmp/sockets/gitlab.socket') do
  it { should be_socket }
end

describe port(8080) do
  it { should be_listening }
end

describe file('/etc/nginx/conf.d/gitlab.conf') do
  it { should be_file }
end
