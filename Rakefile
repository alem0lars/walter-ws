require 'data_mapper'
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new

task :default do
  sh 'rake -T', :verbose => false
end

desc 'Check .travis.yml file format'
task :check_travis do
  sh 'travis-lint', :verbose => false
end

desc 'Prepare the database'
task :db_purge do
  Dir["./models/*.rb"].each { |model| require model }
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/db.sqlite")
  DataMapper::Logger.new('log/db.log', :debug) # displays SQL queries
  DataMapper.auto_upgrade!
end
