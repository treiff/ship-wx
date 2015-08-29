require 'rubygems'
require 'bundler'

Bundler.require

require 'active_record'
require './lib/ships'
require './app'

run App
