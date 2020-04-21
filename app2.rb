require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

def home
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'TUER N'EST POO JOUER !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end