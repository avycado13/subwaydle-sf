require "csv"
require "json"

patterns = {
"weekday" => ["R","O","Y","G","B","OAK"],
"night" => ["O","Y","B","OAK"],
}


patterns.each do |p, routes|
  routings = {}

  routes.each do |r|
    routings[r] = []
    route_csv = File.read("data/#{p}/stops/#{r}.csv")
    csv = CSV.parse(route_csv)
    csv.each do |row|
      routings[r] << row[0]
    end
  end

  puts "Writing to #{p} JSON file"

  file = File.open("../src/data/#{p}/routings.json", "w")
  file.puts JSON.pretty_generate(routings)
  file.close
end
