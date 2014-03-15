require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
end
describe yumrepo('remi') do
  it { should exist }
end
describe yumrepo('mariadb') do
  it { should exist }
end
