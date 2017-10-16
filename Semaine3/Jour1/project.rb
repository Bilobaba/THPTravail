require 'pry'
require 'google_drive'
require 'rubygems'
require 'json'
require 'pp'


l1 = {"ABLEIGES"=>" mairie.ableiges95@wanadoo.fr",
                          "AINCOURT"=>" mairie.aincourt@wanadoo.fr",
                          "VINCENNES"=>" mairie.vincennes@wanadoo.fr",
                          "NOGENT"=>" mairie.nogent@wanadoo.fr",
                          "JOINVILLE"=>" mairie.joinville@wanadoo.fr",
                          "BRY"=>" mairie.bry@wanadoo.fr",
                          "MONTREUIL"=>" mairie.montreil@wanadoo.fr"}



l2 = {aaa: " mairie.ableiges95@wanadoo.fr",
                          bbb: " mairie.aincourt@wanadoo.fr",
                          ccc: " mairie.vincennes@wanadoo.fr",
                          ddd: " mairie.nogent@wanadoo.fr",
                          eee: " mairie.joinville@wanadoo.fr",
                          yyy: " mairie.bry@wanadoo.fr",
                          zzz: " mairie.montreil@wanadoo.fr"}


session = GoogleDrive::Session.from_config("config.json")

f1 = File.new("Fichier_des_emails_des_mairies",  "w+")

f2 = File.new("testfile", "r")
f3 = File.new("newfile",  "w+")
f4 = File.new("newfile", File::CREAT|File::TRUNC|File::RDWR, 0644)

sp = session.create_spreadsheet("Fichier des mails 3")
ws = sp.add_worksheet("Feuille 111")
ws[1,1] = "Hello springfield"

i=1

l2.each do |index,value|
  ws[i,1] = index
  ws[i,2] = value
  i+=1
end

ws.save
binding.pry
puts "Fini"
