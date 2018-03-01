# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.destroy_all
User.destroy_all
#-------------------------------------------------------------------------------
urls = [
  "https://www.leboncoin.fr/locations/1362623176.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1385711512.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1377652859.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1392479371.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1392469156.htm?ca=22_s"
]

# urls.each do |url|
#   p LbcScraper.new(url).extract
# end

# ------------------------------------------------------------------------------
# creation of 4 owners :
marion = User.create!(
  email: "marionblanchard69004@gmail.com",
  password: "myagency69",
  first_name: "Marion",
  last_name: "BLANCHARD",
  phone_number: "06 34 54 13 59",
  address: "2 Ter cours Richard Vitton, 69003 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mjuutjo19df7vnadx0um.jpg"
  )

steeve = User.create!(
  email: "steverichard69004@gmail.com",
  password: "myagency69",
  first_name: "Steeve",
  last_name: "Richard",
  phone_number: "07 89 46 23 09",
  address: "192 grande rue de la Guillotiere, 69007 LYON",
  remote_avatar_url: "https://avatars0.githubusercontent.com/u/32811068?v=4"
  )

jose = User.create!(
  email: "josedupres69004@gmail.com",
  password: "myagency69",
  first_name: "Jose",
  last_name: "DUPRES",
  phone_number: "06 45 76 12 45",
  address: "103 av Berthelot, 69007 LYON",
  remote_avatar_url: "https://avatars3.githubusercontent.com/u/24254220?v=4"
  )

vanessa = User.create!(
  email: "vanessaduchemin69004@gmail.com",
  password: "myagency69",
  first_name: "Vanessa",
  last_name: "DUCHEMIN",
  phone_number: "07 82 57 93 01",
  address: "31 r Romarin, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/zbtubkg3193pagun6ez2.jpg"
  )
# ------------------------------------------------------------------------------
# creation of 6 tenants :
User.create!(
  email: "alexandre.bouvier@gmail.com",
  password: "myagency69",
  first_name: "Alexandre",
  last_name: "BOUVIER",
  phone_number: "06 55 09 02 35",
  address: "38 av Berthelot, 69007 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/frri8d39adeybthbgsx0.jpg"
  )

User.create!(
  email: "alix.peyrot@gmail.com",
  password: "myagency69",
  first_name: "Alix",
  last_name: "PEYROT",
  phone_number: "06 43 49 02 13",
  address: "76 av Jean Mermoz, 69008 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/hwiwrtdiuxqckwavwwwf.jpg"
  )

User.create!(
  email: "etienne.delorieux@gmail.com",
  password: "myagency69",
  first_name: "Etienne",
  last_name: "DELORIEUX",
  phone_number: "07 34 26 53 12",
  address: "5 r Ste Marie des Terreaux, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mx9bazmz2jgmulvhamry.jpg"
  )

User.create!(
  email: "isabelle.pontoizeau@gmail.com",
  password: "myagency69",
  first_name: "Isabelle",
  last_name: "PONTOIZEAU" ,
  phone_number: "06 45 21 45 43",
  address: "2 av Berthelot, 69007 LYON",
  remote_avatar_url: "https://avatars2.githubusercontent.com/u/34674849?v=4"
  )

User.create!(
  email: "louis.delon@gmail.com" ,
  password: "myagency69",
  first_name: "Louis",
  last_name: "DELON",
  phone_number: "06 23 53 24 78",
  address: "6 pl Terreaux, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/qec0kiexjcadwz457xwx.jpg"
  )

User.create!(
  email: "lahbib.belhaddad@gmail.com",
  password: "myagency69",
  first_name: "Lahbib",
  last_name: "BELHADDAD",
  phone_number: "07 32 46 85 23",
  address: "62 grande rue Croix Rousse, 69004 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/evqefyvpwl5csouogibi.jpg"
  )
# ------------------------------------------------------------------------------
# creation of flats :
marion_flat_hash_1 = LbcScraper.new(urls[0]).extract
marion_flat_1 = Flat.create!(
  name: marion_flat_hash_1[:name],
  address: marion_flat_hash_1[:address],
  price: marion_flat_hash_1[:price],
  user_id: marion.id,
  description: marion_flat_hash_1[:description],
  publication_date: marion_flat_hash_1[:publication_date],
  surface: marion_flat_hash_1[:surface],
  nb_rooms: marion_flat_hash_1[:nb_rooms],
  ad_url: urls[0],
  visit_capacity: 3
  )

marion_flat_hash_2 = LbcScraper.new(urls[1]).extract
marion_flat_2 = Flat.create!(
  name: marion_flat_hash_2[:name],
  address: marion_flat_hash_2[:address],
  price: marion_flat_hash_2[:price],
  user_id: marion.id,
  description: marion_flat_hash_2[:description],
  publication_date: marion_flat_hash_2[:publication_date],
  surface: marion_flat_hash_2[:surface],
  nb_rooms: marion_flat_hash_2[:nb_rooms],
  ad_url: urls[1],
  visit_capacity: 3
  )

steeve_flat_hash = LbcScraper.new(urls[2]).extract
steeve_flat = Flat.create!(
  name: steeve_flat_hash[:name],
  address: steeve_flat_hash[:address],
  price: steeve_flat_hash[:price],
  user_id: steeve.id,
  description: steeve_flat_hash[:description],
  publication_date: steeve_flat_hash[:publication_date],
  surface: steeve_flat_hash[:surface],
  nb_rooms: steeve_flat_hash[:nb_rooms],
  ad_url: urls[2],
  visit_capacity: 3
  )

jose_flat_hash = LbcScraper.new(urls[3]).extract
jose_flat = Flat.create!(
  name: jose_flat_hash[:name],
  address: jose_flat_hash[:address],
  price: jose_flat_hash[:price],
  user_id: jose.id,
  description: jose_flat_hash[:description],
  publication_date: jose_flat_hash[:publication_date],
  surface: jose_flat_hash[:surface],
  nb_rooms: jose_flat_hash[:nb_rooms],
  ad_url: urls[3],
  visit_capacity: 3
  )


vanessa_flat_hash = LbcScraper.new(urls[4]).extract
vanessa_flat = Flat.create!(
  name: vanessa_flat_hash[:name],
  address: vanessa_flat_hash[:address],
  price: vanessa_flat_hash[:price],
  user_id: vanessa.id,
  description: vanessa_flat_hash[:description],
  publication_date: vanessa_flat_hash[:publication_date],
  surface: vanessa_flat_hash[:surface],
  nb_rooms: vanessa_flat_hash[:nb_rooms],
  ad_url: urls[4],
  visit_capacity: 3
  )
