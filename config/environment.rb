require 'yaml'
require 'active_record'

db = YAML.load(File.read('./config/database.yml'))
ActiveRecord::Base.establish_connection(db)
