class Player
  
  $reverse = 0 
  $turn_ct = 0 
  
  def play_turn(warrior)
    @health = 0 
    puts "reverse count #{$reverse}"
    puts "turn count #{$turn_ct}"
    if warrior.health != 0 then @health = warrior.health end
    @captive_count = 0
    
    am_hit(warrior)
    attack_defend(warrior) 
    record_health(warrior)
    check_rev(warrior)
    $turn_ct += 1
  end
  
  def am_hit(warrior)
    if @holder == nil then @holder = warrior.health 
    elsif @health < @holder 
      return true
    else 
      return false
    end
  end
  
  def attack_defend(warrior) 
    if warrior.feel.empty? == true && am_hit(warrior) == false
      can_heal(warrior)
    elsif if warrior.feel.empty? == true && am_hit(warrior) == true
      check_status(warrior)
      # warrior.walk!
    elsif warrior.feel.empty? == false && warrior.feel.captive? == true
      warrior.rescue!
  #  elsif warrior.feel(:backward).empty? == true
   #   @captive_count + 1
    elsif warrior.feel.empty? == false 
      warrior.attack!
      #maybe add a conditional for if captive not present but still not just attack
    end
    end
  end
  
  def can_heal(warrior)
    if warrior.health < 20
      warrior.rest!
    else
      $reverse += 1 
      warrior.walk!
    end
  end
  
  def record_health(warrior)
   @holder = warrior.health
  end
  
  def check_status(warrior)
    if warrior.health < 8 && $reverse > 2
     warrior.walk!(:backward)
    else 
     warrior.walk!
     $reverse += 1
    end
  end
  
  def check_rev(warrior)
  	puts "I AM HERE"
    if $reverse >= 0 &&  am_hit(warrior) == false
      $reverse += 2 
    else
      $reverse += 0
    end
  end
  
end

#issue is that health dosnt update at the end 


#basically test if im being hit and then if so walk past captive or free him then attack archer

#elsif @captive_count != 0
     #warrior.walk!(:backward)#
     
     # add a universal constant reverse to track back steps and then walk them while subtracting to 
     #give a negative value so its not always walking backwards