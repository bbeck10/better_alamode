require 'csv'
require 'awesome_print'
require 'json'

big_hash = { }
index = 0
CSV.foreach('city_lat_long_subset.csv', headers: true) do |row|
  index += 1
  puts "on row #{index}"
  big_hash[row['citycountry'].downcase] = {
    "lat" => row['Latitude'],
    "long" => row['Longitude']
  }
end
ap big_hash
File.open('json_cites_lat_long.json', 'w') do |file|
  file.write(big_hash.to_json)
end
