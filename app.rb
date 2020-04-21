require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Définition des joueurs et état des lieux

player1= Player.new("Josiane")
player2= Player.new("José")

while player1.life_points > 0 && player2.life_points >0
	puts "Voici l'état de chaque joueur :"
		print player1.show_state
		print player2.show_state
	puts ""

#Phase d'attaque

	puts "Passons à la phase d'attaque :"
		print player1.attacks(player2)
			if player2.life_points <= 0
				break
			end
		print player2.attacks(player1)
	puts ""
end