require 'rubygems'
require 'bundler/setup'
require 'yaml'
Bundler.require(:default)

Dir["./app/**/*.rb"].each { |f| require f }

I18n.enforce_available_locales = false

class Environment
  def self.environment=(environment)
    Bundler.require(environment)
    @@environment = environment
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details[@@environment])
  end
end
