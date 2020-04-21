class Player
	attr_accessor :name , :life_points


#Initialisation avec le nom + points de vie
	 def initialize(name)
	    @name = name
	    @life_points = 10
	 end

#Méthode pour les points de vie
	def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end 

#Méthode combat et dommage

	def gets_damage(damage_received)
		@life_points= @life_points - damage_received

		if @life_points <= 0
			puts "le joueur #{@name} a été tué, DOMMAGE !"
		end
	end

#Methode attack

	def attacks (victim)
		damage = compute_damage
		puts "le joueur #{@name} attaque le joueur #{victim.name}"
		puts "Il lui inflige #{damage} points de dommages"

		victim.gets_damage(damage)
	end

	def compute_damage
    	return rand(1..6)
  	end

end