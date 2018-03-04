# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting candidacies..."
Candidacy.destroy_all
puts "deleting flats..."
Flat.destroy_all
puts "deleting users..."
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
puts "creating of the 4 owners..."

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
puts "creating of the 6 tenants..."

alexandre = User.create!(
  email: "alexandre.bouvier@gmail.com",
  password: "myagency69",
  first_name: "Alexandre",
  last_name: "BOUVIER",
  phone_number: "06 55 09 02 35",
  address: "38 av Berthelot, 69007 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/frri8d39adeybthbgsx0.jpg"
  )

alix = User.create!(
  email: "alix.peyrot@gmail.com",
  password: "myagency69",
  first_name: "Alix",
  last_name: "PEYROT",
  phone_number: "06 43 49 02 13",
  address: "76 av Jean Mermoz, 69008 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/hwiwrtdiuxqckwavwwwf.jpg"
  )

etienne = User.create!(
  email: "etienne.delorieux@gmail.com",
  password: "myagency69",
  first_name: "Etienne",
  last_name: "DELORIEUX",
  phone_number: "07 34 26 53 12",
  address: "5 r Ste Marie des Terreaux, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mx9bazmz2jgmulvhamry.jpg"
  )

isabelle = User.create!(
  email: "isabelle.pontoizeau@gmail.com",
  password: "myagency69",
  first_name: "Isabelle",
  last_name: "PONTOIZEAU" ,
  phone_number: "06 45 21 45 43",
  address: "2 av Berthelot, 69007 LYON",
  remote_avatar_url: "https://avatars2.githubusercontent.com/u/34674849?v=4"
  )

louis = User.create!(
  email: "louis.delon@gmail.com" ,
  password: "myagency69",
  first_name: "Louis",
  last_name: "DELON",
  phone_number: "06 23 53 24 78",
  address: "6 pl Terreaux, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/qec0kiexjcadwz457xwx.jpg"
  )

lahbib = User.create!(
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

# marion_flat_hash_1 = {:name=>"Appartement T4 Grand Standing", :address=>"Lyon 69006", :price=>"1 725 ", :description=>"Appartement complétementrénové en 2009 au 1er étaged'un immeuble du XIXé siècle avecascenseur très bien situé angleWaldeck- Rousseau / Juliette Récamierà côté placeGénéral Brosset - Prestation hautde gamme - huisseries neuves avec double vitrage24mm - Séjour 36m² et 3 chambres,salle d'eau, wc séparé, lingerieprévue pour LL et SL à condensation- réseau câblé toutespièces - fibre optique -Interphone avecplatines à défilementextérieur et dans le sas d'entrée -nombreux placards - chauffage électriqueradiants - Cuisine américaineéquipée avec plaquesvitrocéramique et hotte - Emplacementsprévus pour frigo, four et lave vaisselle -Compteurs edf et eau privatifs - Cave -garage enlocation sous place Gl Brosset - gare, bus etmétro à 5 min à pied. PAS DECOLOCATION - AGENCE S'ABSTENIRLibre à compter du 2 avril 2018.", :surface=>"94 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"4", :photos=>["https://img5.leboncoin.fr/ad-image/3cd20e2e47702dd598e801a212655de921d41043.jpg", "https://img3.leboncoin.fr/ad-image/fcd0d40ddee051dc974a2c6b16b33be156b9e687.jpg", "https://img3.leboncoin.fr/ad-image/09928876251aa8dead1e94d1f091146039be0b66.jpg"]}
# marion_flat_hash_2 = {:name=>"T2 - Meublé - Mermoz Pinel - Tous Compris", :address=>"Lyon 69008", :price=>"750 ", :description=>"137 Avenue Paul Santy - 69008 LYON Venez découvrir ce jolie T2 situé au 1er étage d'une petite copropriété. Il se compose d'une entrée desservant : - Un coin cuisine entièrement meublé et équipé (Frigo, senseo, bouilloire, plaque vitro, four et micro-onde et tout ustensiles). - Un espace séjour salon avec table et chaises, canapé convertible, télé à LED 80 cm.- Une belle chambre avec lit double et rangement. Salle d'eau avec machine à laver, table et fer à repasser.Parking privatif fermé.Loyer tout compris (charges+eau+électricité+internet )Loyer charges comprises : 750,00€ Loyer hors charges : 700,00€Forfait de charges : 50,00€ Dépôt de garantie : 1400,00€Frais d'agence : 350,00€ Frais d'état des lieux : 105,00€", :surface=>"35 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"2", :photos=>["https://img1.leboncoin.fr/ad-image/40f90f2f011d4844710d474d106c09630ebad0f7.jpg", "https://img1.leboncoin.fr/ad-image/84cabc80ee670d87ff75fbf6ed7cc7b17ee562a4.jpg", "https://img6.leboncoin.fr/ad-image/fdf14d6c35dca98d215fb6e7b1256691af4c21e7.jpg", nil]}
# steeve_flat_hash = {:name=>"Studio - Préfécture -", :address=>"Lyon 69003", :price=>"435 ", :description=>"32 Cours de la Liberté - 69003 LyonVenez découvrir ce jolie studio situé au 5e et dernier étage avec ascenseur. Il se compose d'une grande pièce de vie avec coin nuit et coin cuisine. Salle d'eau et WC.Disponible au 9/02/2018Loyer charges comprises : 435,00€Loyer hors charges : 395,00€Provisions sur charges : 45,00€ Dépôt de garantie : 395,00€Frais d'agence : 180,00€ Frais d'état des lieux : 54,00€", :surface=>"18 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"1", :photos=>["https://img1.leboncoin.fr/ad-image/7b7aeef0ed96cededc7ab77025eee67117fa6d3f.jpg", "https://img2.leboncoin.fr/ad-image/0bdd1deecd36a77e789f42f05e6e09a87daa1b8b.jpg", "https://img7.leboncoin.fr/ad-image/81f2740885fc343500d805409ec3c134dbef66a5.jpg", nil]}
# jose_flat_hash = {:name=>"T1 bis de 35 m² + balcon / quartier Montchat", :address=>"Lyon 69003", :price=>"460 ", :description=>"Au cœur du quartier de Montchat, venez découvrir ce magnifique T1 bis de 35 m² situé au 1er et dernier étage d’un petit  immeuble au 25 Cours Docteur Long – 69003 LYON.Dans une résidence calme, idéal célibataire, ce bien se compose d’une pièce à  vivre de 20 m² avec cuisine semi-équipée(meuble et frigo), d’une chambre en mezzanine de 10,6 m² (8 m² loi Carrez) et salle de bain avec WC.Prêt à vivre, lumineux, chauffage électrique, proche bus et tous  commerces.Date de disponibilité : 31 mars 2018Loyer 460 € / mois+ Charges : 35 € / mois (comprenant l’eau froide,  la taxe d’ordure ménagère, les charges d’immeuble)Honoraires d’agence : 440 € TTCPour tous renseignements et visites n’hésitez pas à nous contacter.IMMO GEST BRIGNAIS – Grégory & Marina – 06 27 21 71 49 -", :surface=>"35 m²", :publication_date=>"01/03/2018 à 11h41", :nb_rooms=>"1", :photos=>["https://img1.leboncoin.fr/ad-image/c5ccd623e5f733350b1cb776b75db8bb9a10f847.jpg", "https://img6.leboncoin.fr/ad-image/7c28fb9d32dfb7a7382751d25f019c82ded21576.jpg", "https://img2.leboncoin.fr/ad-image/48db3de2114826e077413eb8704fbd903015b5a3.jpg", nil]}
# vanessa_flat_hash = {:name=>"T2 mezza étudiant Lyon 7", :address=>"Lyon 69007", :price=>"920 ", :description=>"VICTORIAN PARK, résidence de standing pour étudiants, à quelques minutes seulement de l'université Jean Moulin Lyon III.Elle profite d'une excellente desserte des transports en commun (notamment la principale ligne du métro D), des commerces alentours et de la proximité du nouveau parc Sergent Blandan.La cour intérieure paysagée laisse un calme et une sérénité de vie où les étudiants peuvent se retrouver pour partager des moments de convivialité.A LOUER, T2 mezzanine de 51 m² entièrement meublé et équipé . Prestations de qualité et nombreux services adaptés à la vie étudiante: accès internet gratuit et illimité, accès à la laverie, cafétéria, local à vélo, distribution de courrier, présence rassurante et sécurisante d'un responsable de résidence.En option: nettoyage des appartements, fourniture linge de maison, location place de parking.Frais de dossier : 668 €2 mois de caution", :surface=>"51 m²", :publication_date=>"01/03/2018 à 11h06", :nb_rooms=>"3", :photos=>["https://img3.leboncoin.fr/ad-image/fc379fd82f2442347312d52c6ccbdc27ca1ce454.jpg", "https://img2.leboncoin.fr/ad-image/0dcb9e552b53bfe05d553b9840f01a840053dfc8.jpg", "https://img6.leboncoin.fr/ad-image/a3f874dc474a926eae874de9b64be4982e6072a2.jpg", nil]}

puts "scrapping of LEBONCOIN..."

marion_flat_hash_1 = LbcScraper.new(urls[0]).extract
marion_flat_hash_2 = LbcScraper.new(urls[1]).extract
steeve_flat_hash = LbcScraper.new(urls[2]).extract
jose_flat_hash = LbcScraper.new(urls[3]).extract
vanessa_flat_hash = LbcScraper.new(urls[4]).extract

puts "creating of the 5 flats..."

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
  visit_capacity: 3,
  photo: marion_flat_hash_1[:photo]
  )

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
  visit_capacity: 3,
  photo: marion_flat_hash_2[:photo]
  )

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
  visit_capacity: 3,
  photo: steeve_flat_hash[:photo]
  )

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
  visit_capacity: 3,
  photo: jose_flat_hash[:photo]
  )

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
  visit_capacity: 3,
  photo: vanessa_flat_hash[:photo]
  )

# ------------------------------------------------------------------------------
# creation of candidacies :

puts "creating of the candidacies..."

flats = [marion_flat_1, marion_flat_2, steeve_flat, jose_flat]
tenants = [alexandre, alix, etienne, isabelle, louis]

flats.each do |flat|
  tenants.each do |tenant|
    Candidacy.create!(
      flat_id: flat.id,
      user_id: tenant.id
    )
  end
end

Candidacy.create!(
  flat_id: vanessa_flat.id,
  user_id: lahbib.id
)

puts "Finish mamen!!!"
