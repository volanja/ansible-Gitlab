require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    :name  => '192.168.0.108',
    :user  => 'root',
    :roles => %w( Packages ),
  },
  {
    :name  => '192.168.0.108',
    :user  => 'git',
    :roles => %w( gitlab ),
  },
]

hosts = hosts.map do |host|
  {
    :name       => host[:name],
    :user       => host[:user],
    :roles      => host[:roles],
  }
end

desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'

namespace :serverspec do
  task :all => hosts.map {|h| 'serverspec:' + h[:user] }
  hosts.each do |host|
    desc "Run serverspec for #{host[:user]}"
    RSpec::Core::RakeTask.new(host[:user].to_sym) do |t|
      ENV['TARGET_NAME'] = host[:name]
      ENV['TARGET_USER'] = host[:user]
      t.pattern = 'spec/*/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end

#RSpec::Core::RakeTask.new(:spec) do |t|
#  t.pattern = 'spec/*/*_spec.rb'
#end
