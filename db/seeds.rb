#-------------------------------------------------------------------------------
# pour seeder sur Heroku :
# rails db:seed
# rails db:dump
# git add .
# git commit -m"dumping-db"
# git push heroku master
# rails db:restore_production
# -> myagency
#-------------------------------------------------------------------------------

puts "deleting bookings..."
Booking.destroy_all
puts "deleting availabilities..."
Availability.destroy_all
puts "deleting messages..."
Message.destroy_all
puts "deleting candidacies..."
Candidacy.destroy_all
puts "deleting flats..."
Flat.destroy_all
puts "deleting users..."
User.destroy_all
#-------------------------------------------------------------------------------
urls = [
  "https://www.leboncoin.fr/locations/1387875755.htm?ca=12_s",
  "https://www.leboncoin.fr/locations/1385711512.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1393285526.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1391798377.htm?ca=22_s",
  "https://www.leboncoin.fr/locations/1392469156.htm?ca=22_s"
]

DOC = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mjuutjo19df7vnadx0um.jpg"

# ------------------------------------------------------------------------------
# OWNERS :-----------------------------------------------------------------
# ------------------------------------------------------------------------------


puts "creating of the 4 owners..."

antoine = User.create!(
  email: "antoine.giret@gmail.com",
  password: "myagency69",
  first_name: "Antoine",
  last_name: "GIRET",
  phone_number: "07 82 57 93 01",
  address: "31 r Romarin, 69001 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/zbtubkg3193pagun6ez2.jpg"
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
  remote_avatar_url: "https://avatars3.githubusercontent.com/u/472453?s=400&v=4"
  )

marion = User.create!(
  email: "marionblanchard69004@gmail.com",
  password: "myagency69",
  first_name: "Marion",
  last_name: "BLANCHARD",
  phone_number: "06 34 54 13 59",
  address: "2 Ter cours Richard Vitton, 69003 LYON",
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mjuutjo19df7vnadx0um.jpg"
  )

# ------------------------------------------------------------------------------
# TENANTS :---------------------------------------------------------------------
# ------------------------------------------------------------------------------


puts "creating of the 6 tenants..."

sebastien = User.create!(
  email: "seb.balas@gmail.com",
  password: "myagency69",
  first_name: "Sébastien",
  last_name: "Balas",
  phone_number: "06 45 76 12 45",
  address: "103 av Berthelot, 69007 LYON",
  profil_confirmed: true,
  remote_avatar_url: "https://avatars3.githubusercontent.com/u/24254220?v=4",
  remote_id_card_url: DOC,
  remote_tax_notice_url: DOC,
  remote_payslip_url: DOC
  )

alexandre = User.create!(
  email: "alexandre.bouvier@gmail.com",
  password: "myagency69",
  first_name: "Alexandre",
  last_name: "BOUVIER",
  phone_number: "06 55 09 02 35",
  address: "38 av Berthelot, 69007 LYON",
  profil_confirmed: true,
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/frri8d39adeybthbgsx0.jpg",
  remote_id_card_url: DOC,
  remote_tax_notice_url: DOC,
  remote_payslip_url: DOC
  )

alix = User.create!(
  email: "alix.peyrot@gmail.com",
  password: "myagency69",
  first_name: "Alix",
  last_name: "PEYROT",
  phone_number: "06 43 49 02 13",
  address: "76 av Jean Mermoz, 69008 LYON",
  profil_confirmed: false,
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/hwiwrtdiuxqckwavwwwf.jpg"
  )

etienne = User.create!(
  email: "etienne.delorieux@gmail.com",
  password: "myagency69",
  first_name: "Etienne",
  last_name: "DELORIEUX",
  phone_number: "07 34 26 53 12",
  address: "5 r Ste Marie des Terreaux, 69001 LYON",
  profil_confirmed: true,
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/mx9bazmz2jgmulvhamry.jpg",
  remote_id_card_url: DOC,
  remote_tax_notice_url: DOC,
  remote_payslip_url: DOC
  )

isabelle = User.create!(
  email: "isabelle.pontoizeau@gmail.com",
  password: "myagency69",
  first_name: "Isabelle",
  last_name: "PONTOIZEAU" ,
  phone_number: "06 45 21 45 43",
  address: "2 av Berthelot, 69007 LYON",
  profil_confirmed: true,
  remote_avatar_url: "https://avatars2.githubusercontent.com/u/34674849?v=4",
  remote_id_card_url: DOC,
  remote_tax_notice_url: DOC,
  remote_payslip_url: DOC
  )

louis = User.create!(
  email: "louis.delon@gmail.com" ,
  password: "myagency69",
  first_name: "Louis",
  last_name: "DELON",
  phone_number: "06 23 53 24 78",
  address: "6 pl Terreaux, 69001 LYON",
  profil_confirmed: true,
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/qec0kiexjcadwz457xwx.jpg",
  remote_id_card_url: DOC,
  remote_tax_notice_url: DOC,
  remote_payslip_url: DOC
  )

lahbib = User.create!(
  email: "lahbib.belhaddad@gmail.com",
  password: "myagency69",
  first_name: "Lahbib",
  last_name: "BELHADDAD",
  phone_number: "07 32 46 85 23",
  address: "62 grande rue Croix Rousse, 69004 LYON",
  profil_confirmed: false,
  remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/evqefyvpwl5csouogibi.jpg"
  )


# ------------------------------------------------------------------------------
# FLATS :-----------------------------------------------------------------------
# ------------------------------------------------------------------------------

# marion_flat_hash_1 = {:name=>"Appartement T4 Grand Standing", :address=>"Lyon 69006", :price=>"1 725 ", :description=>"Appartement complétementrénové en 2009 au 1er étaged'un immeuble du XIXé siècle avecascenseur très bien situé angleWaldeck- Rousseau / Juliette Récamierà côté placeGénéral Brosset - Prestation hautde gamme - huisseries neuves avec double vitrage24mm - Séjour 36m² et 3 chambres,salle d'eau, wc séparé, lingerieprévue pour LL et SL à condensation- réseau câblé toutespièces - fibre optique -Interphone avecplatines à défilementextérieur et dans le sas d'entrée -nombreux placards - chauffage électriqueradiants - Cuisine américaineéquipée avec plaquesvitrocéramique et hotte - Emplacementsprévus pour frigo, four et lave vaisselle -Compteurs edf et eau privatifs - Cave -garage enlocation sous place Gl Brosset - gare, bus etmétro à 5 min à pied. PAS DECOLOCATION - AGENCE S'ABSTENIRLibre à compter du 2 avril 2018.", :surface=>"94 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"4", :photos=>["https://img5.leboncoin.fr/ad-image/3cd20e2e47702dd598e801a212655de921d41043.jpg", "https://img3.leboncoin.fr/ad-image/fcd0d40ddee051dc974a2c6b16b33be156b9e687.jpg", "https://img3.leboncoin.fr/ad-image/09928876251aa8dead1e94d1f091146039be0b66.jpg"]}
# marion_flat_hash_2 = {:name=>"T2 - Meublé - Mermoz Pinel - Tous Compris", :address=>"Lyon 69008", :price=>"750 ", :description=>"137 Avenue Paul Santy - 69008 LYON Venez découvrir ce jolie T2 situé au 1er étage d'une petite copropriété. Il se compose d'une entrée desservant : - Un coin cuisine entièrement meublé et équipé (Frigo, senseo, bouilloire, plaque vitro, four et micro-onde et tout ustensiles). - Un espace séjour salon avec table et chaises, canapé convertible, télé à LED 80 cm.- Une belle chambre avec lit double et rangement. Salle d'eau avec machine à laver, table et fer à repasser.Parking privatif fermé.Loyer tout compris (charges+eau+électricité+internet )Loyer charges comprises : 750,00€ Loyer hors charges : 700,00€Forfait de charges : 50,00€ Dépôt de garantie : 1400,00€Frais d'agence : 350,00€ Frais d'état des lieux : 105,00€", :surface=>"35 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"2", :photos=>["https://img1.leboncoin.fr/ad-image/40f90f2f011d4844710d474d106c09630ebad0f7.jpg", "https://img1.leboncoin.fr/ad-image/84cabc80ee670d87ff75fbf6ed7cc7b17ee562a4.jpg", "https://img6.leboncoin.fr/ad-image/fdf14d6c35dca98d215fb6e7b1256691af4c21e7.jpg", nil]}
# steeve_flat_hash = {:name=>"Studio - Préfécture -", :address=>"Lyon 69003", :price=>"435 ", :description=>"32 Cours de la Liberté - 69003 LyonVenez découvrir ce jolie studio situé au 5e et dernier étage avec ascenseur. Il se compose d'une grande pièce de vie avec coin nuit et coin cuisine. Salle d'eau et WC.Disponible au 9/02/2018Loyer charges comprises : 435,00€Loyer hors charges : 395,00€Provisions sur charges : 45,00€ Dépôt de garantie : 395,00€Frais d'agence : 180,00€ Frais d'état des lieux : 54,00€", :surface=>"18 m²", :publication_date=>"28/02/2018 à 11h37", :nb_rooms=>"1", :photos=>["https://img1.leboncoin.fr/ad-image/7b7aeef0ed96cededc7ab77025eee67117fa6d3f.jpg", "https://img2.leboncoin.fr/ad-image/0bdd1deecd36a77e789f42f05e6e09a87daa1b8b.jpg", "https://img7.leboncoin.fr/ad-image/81f2740885fc343500d805409ec3c134dbef66a5.jpg", nil]}
# jose_flat_hash = {:name=>"T1 bis de 35 m² + balcon / quartier Montchat", :address=>"Lyon 69003", :price=>"460 ", :description=>"Au cœur du quartier de Montchat, venez découvrir ce magnifique T1 bis de 35 m² situé au 1er et dernier étage d’un petit  immeuble au 25 Cours Docteur Long – 69003 LYON.Dans une résidence calme, idéal célibataire, ce bien se compose d’une pièce à  vivre de 20 m² avec cuisine semi-équipée(meuble et frigo), d’une chambre en mezzanine de 10,6 m² (8 m² loi Carrez) et salle de bain avec WC.Prêt à vivre, lumineux, chauffage électrique, proche bus et tous  commerces.Date de disponibilité : 31 mars 2018Loyer 460 € / mois+ Charges : 35 € / mois (comprenant l’eau froide,  la taxe d’ordure ménagère, les charges d’immeuble)Honoraires d’agence : 440 € TTCPour tous renseignements et visites n’hésitez pas à nous contacter.IMMO GEST BRIGNAIS – Grégory & Marina – 06 27 21 71 49 -", :surface=>"35 m²", :publication_date=>"01/03/2018 à 11h41", :nb_rooms=>"1", :photos=>["https://img1.leboncoin.fr/ad-image/c5ccd623e5f733350b1cb776b75db8bb9a10f847.jpg", "https://img6.leboncoin.fr/ad-image/7c28fb9d32dfb7a7382751d25f019c82ded21576.jpg", "https://img2.leboncoin.fr/ad-image/48db3de2114826e077413eb8704fbd903015b5a3.jpg", nil]}
# vanessa_flat_hash = {:name=>"T2 mezza étudiant Lyon 7", :address=>"Lyon 69007", :price=>"920 ", :description=>"VICTORIAN PARK, résidence de standing pour étudiants, à quelques minutes seulement de l'université Jean Moulin Lyon III.Elle profite d'une excellente desserte des transports en commun (notamment la principale ligne du métro D), des commerces alentours et de la proximité du nouveau parc Sergent Blandan.La cour intérieure paysagée laisse un calme et une sérénité de vie où les étudiants peuvent se retrouver pour partager des moments de convivialité.A LOUER, T2 mezzanine de 51 m² entièrement meublé et équipé . Prestations de qualité et nombreux services adaptés à la vie étudiante: accès internet gratuit et illimité, accès à la laverie, cafétéria, local à vélo, distribution de courrier, présence rassurante et sécurisante d'un responsable de résidence.En option: nettoyage des appartements, fourniture linge de maison, location place de parking.Frais de dossier : 668 €2 mois de caution", :surface=>"51 m²", :publication_date=>"01/03/2018 à 11h06", :nb_rooms=>"3", :photos=>["https://img3.leboncoin.fr/ad-image/fc379fd82f2442347312d52c6ccbdc27ca1ce454.jpg", "https://img2.leboncoin.fr/ad-image/0dcb9e552b53bfe05d553b9840f01a840053dfc8.jpg", "https://img6.leboncoin.fr/ad-image/a3f874dc474a926eae874de9b64be4982e6072a2.jpg", nil]}

puts "scrapping of LEBONCOIN..."

antoine_flat_hash_1 = LbcScraper.new(urls[0]).extract
antoine_flat_hash_2 = LbcScraper.new(urls[1]).extract
steeve_flat_hash = LbcScraper.new(urls[2]).extract
jose_flat_hash = LbcScraper.new(urls[3]).extract
marion_flat_hash = LbcScraper.new(urls[4]).extract

puts "creating of the 5 flats..."

antoine_flat_1 = Flat.create!(
  name: antoine_flat_hash_1[:name],
  address: antoine_flat_hash_1[:address],
  price: antoine_flat_hash_1[:price],
  user_id: antoine.id,
  description: antoine_flat_hash_1[:description],
  publication_date: antoine_flat_hash_1[:publication_date],
  surface: antoine_flat_hash_1[:surface],
  nb_rooms: antoine_flat_hash_1[:nb_rooms],
  ad_url: urls[0],
  visit_capacity: 3,
  photo: antoine_flat_hash_1[:photo]
  )

antoine_flat_2 = Flat.create!(
  name: antoine_flat_hash_2[:name],
  address: antoine_flat_hash_2[:address],
  price: antoine_flat_hash_2[:price],
  user_id: antoine.id,
  description: antoine_flat_hash_2[:description],
  publication_date: antoine_flat_hash_2[:publication_date],
  surface: antoine_flat_hash_2[:surface],
  nb_rooms: antoine_flat_hash_2[:nb_rooms],
  ad_url: urls[1],
  visit_capacity: 3,
  photo: antoine_flat_hash_2[:photo]
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

marion_flat = Flat.create!(
  name: marion_flat_hash[:name],
  address: marion_flat_hash[:address],
  price: marion_flat_hash[:price],
  user_id: marion.id,
  description: marion_flat_hash[:description],
  publication_date: marion_flat_hash[:publication_date],
  surface: marion_flat_hash[:surface],
  nb_rooms: marion_flat_hash[:nb_rooms],
  ad_url: urls[4],
  visit_capacity: 3,
  photo: marion_flat_hash[:photo]
  )

# ------------------------------------------------------------------------------
# CANDIDACIES :-----------------------------------------------------------------
# ------------------------------------------------------------------------------

puts "creating of the candidacies..."

flats = [antoine_flat_1, antoine_flat_2, steeve_flat, jose_flat]
tenants = [sebastien, alexandre, alix, etienne, isabelle, louis, lahbib]
status_table = ["Dossier retenu", "Visite effectuée", "Visite programmée", "En attente", "Dossier archivé"]


# ------------------------------------------------------------------------------
# Candidacies for antoine's flat 1

antoine_1_seb = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: sebastien.id,
  status: "Visite effectuée"
  )

antoine_1_etienne = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: etienne.id,
  status: "Visite effectuée"
  )

antoine_1_alex = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: alexandre.id,
  status: "Visite programmée"
  )

antoine_1_isa = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: isabelle.id,
  status: "Visite programmée"
  )

antoine_1_alix = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: alix.id,
  status: "En attente"
  )

antoine_1_louis = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: louis.id,
  status: "En attente"
  )

antoine_1_lahbib = Candidacy.create!(
  flat_id: antoine_flat_1.id,
  user_id: lahbib.id,
  status: "Dossier archivé"
  )

# ------------------------------------------------------------------------------
# Candidacies for antoine's flat 2

antoine_2_alex = Candidacy.create!(
  flat_id: antoine_flat_2.id,
  user_id: alexandre.id,
  status: "Visite programmée"
  )

antoine_2_seb = Candidacy.create!(
  flat_id: antoine_flat_2.id,
  user_id: sebastien.id,
  status: "Visite programmée"
  )

antoine_2_lahbib = Candidacy.create!(
  flat_id: antoine_flat_2.id,
  user_id: lahbib.id,
  status: "En attente"
  )

antoine_2_alix = Candidacy.create!(
  flat_id: antoine_flat_2.id,
  user_id: alix.id,
  status: "En attente"
  )

# ------------------------------------------------------------------------------
# Candidacies for Steeve's flat

steeve_etienne = Candidacy.create!(
  flat_id: steeve_flat.id,
  user_id: etienne.id,
  status: "Visite programmée"
  )

steeve_alex = Candidacy.create!(
  flat_id: steeve_flat.id,
  user_id: alexandre.id,
  status: "Visite programmée"
  )

steeve_seb = Candidacy.create!(
  flat_id: steeve_flat.id,
  user_id: sebastien.id,
  status: "Visite programmée"
  )

steeve_lahbib = Candidacy.create!(
  flat_id: steeve_flat.id,
  user_id: lahbib.id,
  status: "En attente"
  )

steeve_alix = Candidacy.create!(
  flat_id: steeve_flat.id,
  user_id: alix.id,
  status: "En attente"
  )

# ------------------------------------------------------------------------------
# Candidacies for Jose's flat

jose_alix = Candidacy.create!(
  flat_id: jose_flat.id,
  user_id: alix.id,
  status: "Visite effectuée"
  )

jose_etienne = Candidacy.create!(
  flat_id: jose_flat.id,
  user_id: etienne.id,
  status: "Visite effectuée"
  )

jose_alex = Candidacy.create!(
  flat_id: jose_flat.id,
  user_id: alexandre.id,
  status: "Visite programmée"
  )

jose_isa = Candidacy.create!(
  flat_id: jose_flat.id,
  user_id: isabelle.id,
  status: "Dossier archivé"
  )

# ------------------------------------------------------------------------------
# Candidacies for marion's flat

marion_etienne = Candidacy.create!(
  flat_id: marion_flat.id,
  user_id: etienne.id,
  status: "Visite programmée"
  )

marion_alex = Candidacy.create!(
  flat_id: marion_flat.id,
  user_id: alexandre.id,
  status: "Visite programmée"
  )

marion_seb = Candidacy.create!(
  flat_id: marion_flat.id,
  user_id: sebastien.id,
  status: "Visite programmée"
  )

marion_lahbib = Candidacy.create!(
  flat_id: marion_flat.id,
  user_id: lahbib.id,
  status: "En attente"
  )

marion_alix = Candidacy.create!(
  flat_id: marion_flat.id,
  user_id: alix.id,
  status: "En attente"
  )

# ------------------------------------------------------------------------------
# MESSAGES :--------------------------------------------------------------------
# ------------------------------------------------------------------------------
# INBOX: ANTOINE 1--------------------------------------------------------------
puts "creating of the messages..."


# Messages btw antoine and sebastien 1

Message.create!(
  content: "Bonjour Antoine",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: sebastien,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "Parfait. À jeudi.",
  read: true,
  sender: antoine,
  recipient: sebastien,
  candidacy: antoine_1_seb
  )

Message.create!(
  content: "Encore merci pour la visite, j'ai vraiment apprécié votre appartement.",
  read: false,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_1_seb
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and etienne 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: etienne,
  recipient: antoine,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: etienne,
  recipient: antoine,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: etienne,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: etienne,
  recipient: antoine,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: true,
  sender: etienne,
  recipient: antoine,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "Parfait. À vendredi.",
  read: true,
  sender: antoine,
  recipient: etienne,
  candidacy: antoine_1_etienne
  )

Message.create!(
  content: "Merci pour la visite.",
  read: false,
  sender: etienne,
  recipient: antoine,
  candidacy: antoine_1_etienne
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and alex 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_1_alex
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_1_alex
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: alexandre,
  candidacy: antoine_1_alex
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_1_alex
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: false,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_1_alex
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and isa 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: isabelle,
  recipient: antoine,
  candidacy: antoine_1_isa
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: isabelle,
  recipient: antoine,
  candidacy: antoine_1_isa
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: isabelle,
  candidacy: antoine_1_isa
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: isabelle,
  recipient: antoine,
  candidacy: antoine_1_isa
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: true,
  sender: isabelle,
  recipient: antoine,
  candidacy: antoine_1_isa
  )

Message.create!(
  content: "Parfait. À demain.",
  read: true,
  sender: antoine,
  recipient: isabelle,
  candidacy: antoine_1_isa
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and alix 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: alix,
  recipient: antoine,
  candidacy: antoine_1_alix
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: alix,
  recipient: antoine,
  candidacy: antoine_1_alix
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: alix,
  candidacy: antoine_1_alix
  )


# ------------------------------------------------------------------------------
# Messages btw antoine and louis 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: louis,
  recipient: antoine,
  candidacy: antoine_1_louis
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: false,
  sender: louis,
  recipient: antoine,
  candidacy: antoine_1_louis
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and lahbib 1

Message.create!(
  content: "Bonjour",
  read: true,
  sender: lahbib,
  recipient: antoine,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: lahbib,
  recipient: antoine,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: lahbib,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: lahbib,
  recipient: antoine,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: true,
  sender: lahbib,
  recipient: antoine,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "Parfait. À vendredi.",
  read: true,
  sender: antoine,
  recipient: lahbib,
  candidacy: antoine_1_lahbib
  )

Message.create!(
  content: "Merci pour la visite d'hier. C'était top.",
  read: true,
  sender: lahbib,
  recipient: antoine,
  candidacy: antoine_1_lahbib
  )

# ------------------------------------------------------------------------------
# INBOX: ANTOINE 2 -------------------------------------------------------------

# Messages btw antoine and alex 2

Message.create!(
  content: "Bonjour",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_2_alex
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_2_alex
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: alexandre,
  candidacy: antoine_2_alex
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_2_alex
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: false,
  sender: alexandre,
  recipient: antoine,
  candidacy: antoine_2_alex
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and seb 2

Message.create!(
  content: "Bonjour",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_2_seb
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé. Je selectionne une visite dès que possible.",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_2_seb
  )

Message.create!(
  content: "De rien, j'attends votre booking.",
  read: true,
  sender: antoine,
  recipient: sebastien,
  candidacy: antoine_2_seb
  )

Message.create!(
  content: "Done!",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_2_seb
  )

Message.create!(
  content: "Hâte de visiter votre appartement.",
  read: true,
  sender: sebastien,
  recipient: antoine,
  candidacy: antoine_2_seb
  )

Message.create!(
  content: "Parfait. À jeudi pour la visite.",
  read: true,
  sender: antoine,
  recipient: sebastien,
  candidacy: antoine_2_seb
  )

# ------------------------------------------------------------------------------
# Messages btw antoine and alix 2

Message.create!(
  content: "Bonjour Antoine",
  read: false,
  sender: alix,
  recipient: antoine,
  candidacy: antoine_2_alix
  )

Message.create!(
  content: "Merci pour votre annonce, je suis très intéressé par votre bel appartement.",
  read: false,
  sender: alix,
  recipient: antoine,
  candidacy: antoine_2_alix
  )

# ------------------------------------------------------------------------------
# AVAILABILITIES :--------------------------------------------------------------
# ------------------------------------------------------------------------------
# ANTOINE'S FLAT 1--------------------------------------------------------------

puts "creating of the availabilities..."

availability_flat1_old_1 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 05 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_old_2 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 05 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_1 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_2 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_3 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 13:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_4 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 12:00:00 UTC +00:00",
  visit_confirmed: false
  )


availability_flat1_5 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 18:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_6 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Thu, 08 Mar 2018 19:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_7 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 12 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_8 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 12 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_9 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 12 Mar 2018 17:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_10 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 12 Mar 2018 18:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_11 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Mon, 12 Mar 2018 19:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_12 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Tue, 13 Mar 2018 12:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_13 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Tue, 13 Mar 2018 13:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat1_14 = Availability.create!(
  flat_id: antoine_flat_1.id,
  start_time: "Tue, 13 Mar 2018 14:00:00 UTC +00:00",
  visit_confirmed: false
  )


# ------------------------------------------------------------------------------
# ANTOINE'S FLAT 2--------------------------------------------------------------

availability_flat2_old_1 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 05 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_old_2 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 05 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_1 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_2 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_3 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 13:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_4 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 12:00:00 UTC +00:00",
  visit_confirmed: false
  )


availability_flat2_5 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 18:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_6 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Thu, 08 Mar 2018 19:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_7 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 12 Mar 2018 10:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_8 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 12 Mar 2018 11:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_9 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 12 Mar 2018 17:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_10 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 12 Mar 2018 18:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_11 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Mon, 12 Mar 2018 19:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_12 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Tue, 13 Mar 2018 12:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_13 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Tue, 13 Mar 2018 13:00:00 UTC +00:00",
  visit_confirmed: false
  )

availability_flat2_14 = Availability.create!(
  flat_id: antoine_flat_2.id,
  start_time: "Tue, 13 Mar 2018 14:00:00 UTC +00:00",
  visit_confirmed: false
  )

# ------------------------------------------------------------------------------
# BOOKINGS :--------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ANTOINE'S FLAT 1--------------------------------------------------------------

puts "creating of the bookings..."

Booking.create!(
  availability: availability_flat1_old_1,
  candidacy: antoine_1_seb
  )

Booking.create!(
  availability: availability_flat1_old_2,
  candidacy: antoine_1_etienne
  )

Booking.create!(
  availability: availability_flat1_7,
  candidacy: antoine_1_alex
  )

Booking.create!(
  availability: availability_flat1_8,
  candidacy: antoine_1_isa
  )

# ------------------------------------------------------------------------------
# ANTOINE'S FLAT 2--------------------------------------------------------------

Booking.create!(
  availability: availability_flat2_9,
  candidacy: antoine_2_alex
  )

Booking.create!(
  availability: availability_flat2_10,
  candidacy: antoine_2_seb
  )

puts "Finish mamen!!!"
