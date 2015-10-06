require 'multi_json'
require 'csv'

body = File.read('/Users/ac/Startup/startlines/json/inprogress/github.csv')
csv = CSV.new(body, :headers => true, :header_converters => :symbol)
json = csv.to_a.map {|row| row.to_hash }
File.write '/Users/ac/Startup/startlines/json/inprogress/github.json', MultiJson.dump(json, pretty: true)
