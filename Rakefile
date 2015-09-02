require './config/environment'

namespace :db do
  desc "create the database"
  task :create do

  end
  desc "migrate the database"
  task :migrate do
    require 'bundler'
    Bundler.require
    ActiveRecord::Migrator.migrate('db/migrate')
  end
end

namespace :ship do
  desc "fetch latest wx"
  task :weather do
    require './lib/ships'
    require 'nokogiri'
    require 'open-uri'

    # Truncate table before inserting new ships.
    puts "Truncating ships table \n"
    Ship.all.each do |ship|
      ship.destroy
    end

    doc = Nokogiri::HTML(open("http://www.ndbc.noaa.gov/ship_obs.php"))
    output =[]
    ship_hash = {}
    params = [:hour, :lat, :long, :wdir, :wspd, :gst, :wvht,
              :dpd, :pres, :ptdy, :atmp, :wtmp, :dewp, :vis ]
    length = doc.at('pre').children.length

    doc.at('pre').children.each_with_index do |element, index|
      next if index == 0
      row = element.text.split(" ")
      row.shift
      row.pop(9)
      output << row
    end

    # Remove any empty arrays, remove bad data at end of array.
    output.reject! { |i| i.empty? }.pop

    # Sub out any dashes in fields with null.
    output.each do |ship|
      ship.each do |field|
        field.gsub!(/(?!\-+(?=\d))\-{1,5}/, 'null')
      end
    end

    # Insert each ship into db.
    output.each do |ship|
      ship.each_with_index do |field, index|
        if index == 1 || index == 2
          ship_hash[params[index]] = field.to_f
        else
          ship_hash[params[index]] = field
        end
      end
      Ship.create(ship_hash)
    end
    puts "\nTotal ships created: #{output.length}"
  end
end
