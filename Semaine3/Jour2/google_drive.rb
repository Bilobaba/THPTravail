require 'google_drive'
require 'pry'


# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")


# Gets list of remote files.
session.files.each do |file|
  p file.title
end

binding.pry

# Uploads a local file.
destination2 = "Mon Drive/Bilobaba/Programmation/TheHackingProject/Test_drive/hello2.txt"
session.upload_from_file("hello.txt", "hello1.txt", convert: false)
session.upload_from_file("hello.txt", destination2, convert: false)

binding.pry

# Downloads to a local file.
file = session.file_by_title("hello.txt")

binding.pry

file.download_to_file("/path/to/hello.txt")

binding.pry

# Updates content of the remote file.
file.update_from_file("/path/to/hello.txt")
binding.pry

p "C est fini"
