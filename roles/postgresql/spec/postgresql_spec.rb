require 'spec_helper'

describe package('postgresql94') do
  it { should be_installed }
end

describe package('postgresql94-server') do
  it { should be_installed }
end

describe package('postgresql94-devel') do
  it { should be_installed }
end

describe package('postgresql94-libs') do
  it { should be_installed }
end

describe service('postgresql-9.4') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(5432) do
  it { should be_listening }
end

describe file('/tmp/.s.PGSQL.5432') do
  it { should be_socket }
end

describe file('/var/lib/pgsql/9.4/data/postgresql.conf') do
  it { should be_file }
end

describe yumrepo('pgdg') do
   it { should exist }
end
