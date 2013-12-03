require 'spec_helper'

## direcotory
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

## network
describe file('/home/git/gitlab/tmp/sockets/gitlab.socket') do
  it { should be_socket }
end

describe port(8080) do
  it { should be_listening }
end

# file
describe file('/home/git/gitlab/config/database.yml') do
  it { should be_file }
end

describe file('/home/git/gitlab/config/gitlab.yml') do
  it { should be_file }
end

describe file('/etc/init.d/gitlab') do
  it { should be_file }
end

describe file('/etc/nginx/conf.d/gitlab.conf') do
  it { should be_file }
end

## permisson
describe command("-u git ls -ltad /home/git/gitlab/log |awk '{print $1}'") do
  it { should return_stdout 'drwxrwxr-x' }
end

describe command("-u git ls -ltad /home/git/gitlab/tmp |awk '{print $1}'") do
  it { should return_stdout 'drwxrwxr-x' }
end
