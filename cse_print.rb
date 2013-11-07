require 'net/scp'
require 'highline/import'

login = 'thiem'

def transfer_file(login, password, file)
	host = 'stdlinux.cse.ohio-state.edu'

	Net::SCP.start(host, login, :password => password) do |scp|
		puts 'File Transfer Started'
		scp.upload(file, '.')
	end

	puts 'File Transfer Ended'
end

# Get the login name
print "Login: "
login = gets.chomp

# Get the password
password = ask("Password: ") { |q| q.echo="*" }

# Transfer the file
transfer_file(login, password, 'test.txt')
