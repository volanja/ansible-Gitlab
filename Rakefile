require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('spec/properties.yml')

desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'

namespace :serverspec do
  task :all => properties.keys.map {|key| 'serverspec:' + key }
  properties.keys.each do |key|
    desc "Run serverspec for #{key}"
    RSpec::Core::RakeTask.new(key.to_sym) do |t|
      ENV['TARGET_HOST'] = properties[key]["ip"]
      ENV['TARGET_PRIVATE_KEY'] = properties[key]["private_key"]
      ENV['TARGET_USER'] = key
      t.pattern = 'spec/{' + properties[key]["roles"].join(',') + '}/*_spec.rb'
    end
  end
end
