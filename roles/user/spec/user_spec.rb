require 'spec_helper'

describe user('git') do
  it { should exist }
  it { should have_home_directory '/home/git' }
end

describe file('/home/git/.gitconfig') do
  it { should be_mode 664 }
  it { should be_owned_by 'git' }
end

describe file('/etc/sudoers.d/git') do
  it { should be_mode 440 }
  it { should be_owned_by 'root' }
end

describe file('/home/git/.ssh') do
  it { should be_directory }
  it { should be_mode 700 }
  it { should be_owned_by 'git' }
end
describe file('/home/git/.ssh/authorized_keys') do
  it { should be_mode 600 }
  it { should be_owned_by 'git' }
end
