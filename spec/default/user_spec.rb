require 'spec_helper'

describe user('git') do
  it { should exist }
  it { should have_home_directory '/home/git' }
end
