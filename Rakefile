#!/usr/bin/env ruby
# -*- ruby -*-

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc "Run tests"
task :default => [ 'db:test:prepare', :spec ]

require_relative 'lib/environment'

db_namespace = namespace :db do
  desc "Migrate the db"
  task :migrate do
    Environment.environment = 'development'
    ActiveRecord::Migrator.migrate("db/migrate/")
    db_namespace["schema:dump"].invoke
  end
  namespace :test do
    desc "Prepare the test database"
    task :prepare do
      Environment.environment = 'test'
      file = ENV['SCHEMA'] || "db/schema.rb"
      if File.exists?(file)
        load(file)
      else
        abort %{#{file} doesn't exist yet. Run `rake db:migrate` to create it.}
      end
    end
  end
  desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
  task :rollback do
    Environment.environment = 'development'
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback(ActiveRecord::Migrator.migrations_paths, step)
    db_namespace["schema:dump"].invoke
  end
  namespace :schema do
    desc 'Create a db/schema.rb file that can be portably used against any DB supported by AR'
    task :dump do
      require 'active_record/schema_dumper'
      Environment.environment = 'development'
      filename = ENV['SCHEMA'] || "db/schema.rb"
      File.open(filename, "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end
end
