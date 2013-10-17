require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    :user  => 'root',
    :roles => %w( Packages ),
  },
  {
    :user  => 'git',
    :roles => %w( gitlab ),
  },
]

hosts = hosts.map do |host|
  {
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
      ENV['TARGET_USER'] = host[:user]
      t.pattern = 'spec/*/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end

#RSpec::Core::RakeTask.new(:spec) do |t|
#  t.pattern = 'spec/*/*_spec.rb'
#end
