require 'net/scp'
require 'highline/import'

# This method transfers a file from the current directory to the
# home folder of an OSU CSE student
#
# INPUT: login (OSU CSE login name), password (OSU CSE password), file (name of file, with extension, located in current directory)
#
# OUTPUT: void
def transfer_file(login, password, file)
	host = 'stdlinux.cse.ohio-state.edu'

	Net::SCP.start(host, login, :password => password) do |scp|
		puts 'File Transfer Started'
		scp.upload(file, '.')
	end

	puts 'File Transfer Ended'
end

# This method gets a list of desired printers from the
# 'desired_printers.txt' file.
#
# INPUT: void
# OUTPUT: an array of strings, each string representing an OSU CSE printer
def get_desired_printers

	printers = File.open('desired_printers.txt').read

end

# Get the name of the document to print
print "Name of file to print (with extension): "
document = gets.chomp

# Get the login name
print "Login: "
login = gets.chomp

# Get the password
password = ask("Password: ") { |q| q.echo="*" }

# Transfer the file
transfer_file(login, password, document)

# Get the desired printers from the text file
printers = get_desired_printers

# Print the document

