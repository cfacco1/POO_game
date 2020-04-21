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

#Human Player => héritage

class HumanPlayer < Player
  attr_accessor :weapon_level

 def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}" 
  end 

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
  	weapon_level = rand(1..6) #Level de l'arme
  	puts "Tu as trouvé une arme de niveau #{weapon_level}"
  	if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
  	pv = rand(1..6)
  	if pv == 1
  		puts "tu as trouvé R..."
  	end
  	if (pv > 1) && (pv < 6)
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points>100
        @life_points = 100
      end
    end
    if pv == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points>100 
        @life_points = 100 
      end
    end
  end
end

