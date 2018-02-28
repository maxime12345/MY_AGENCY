# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = [
  "https://www.leboncoin.fr/locations/1362623176.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1385711512.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1377652859.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1392479371.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1392469156.htm?ca=22_s"
]

urls.each do |url|
  p LbcScraper.new(url).extract
end




