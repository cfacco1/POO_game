require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def home
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'TUER N'EST POO JOUER !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

home

#Initialisation du joueur

def init_player
  print "Quel est ton blaze ? "
  print ">>"
  player_name = gets.chomp
  player_h = HumanPlayer.new(player_name)
  puts "J'ai créé ton personnage de winner #{player_name}!"
  return player_h
end

player_human = init_player

#Initialisation des ennemies 

player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1,player2]

#Le combat

while player_human.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	print player_human.show_state

#Quelle action veux-tu effectuer ?

 	puts "**********************************"
  	puts "Quelle action veux-tu effectuer ? "
  	puts
  	puts "a - chercher une meilleure arme"
  	puts "s - chercher à se soigner "
 	puts
  	puts "attaquer un joueur en vue :"
  	  	if player1.life_points > 0
    		print "0 - "
    		print "#{player1.show_state}"
    	end
    	if player2.life_points > 0
    		print "1 - "
    		print "#{player2.show_state}"
    	end
  	puts ""
  	puts "Quel est ton choix, amigo?"
  	choice = gets.chomp
	puts "----------------------------------"

	if choice == "a"
		player_human.search_weapon
	end

	if choice == "s"
		player_human.search_health_pack
	end

	if choice == "0" && player1.life_points > 0
    	player_human.attacks(player1)
 	end
  	
  	if choice == "1" && player2.life_points > 0
    	player_human.attacks(player2)
  	end

  	#riposte des ennemies
	puts "----------------------------------"
  	puts "Les autres joueurs t'attaquent !"
  	ennemies.each do | player |
	    if player.life_points>0
	    	player.attacks(player_human)
	    end
  	end
end

#Fin

puts "**********************************"
puts "*** END OF THE GAME ***"
if player_human.life_points > 0
  puts "WINNER !"
else 
  puts "GAME OVER !"
end
puts "**********************************"