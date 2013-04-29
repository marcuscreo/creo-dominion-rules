class CombatRound

  #good
  def initialize
    @player_hash = Hash.new
  end

  #good
  def add_player(player)
    @player_hash[player.name] = player
  end

  #this doesn't seem necessary
  def get_player_by_name(player_name)
    returned_player = Object.new
    @player_hash.each do |key, player|
      if player_name == player.name
        returned_player = player
      end
    end
    returned_player
  end


  def get_player_list
    @player_hash.values
  end

  def get_sorted_player_list
    sort_players_by_timing(@player_hash.values)
  end

  def do_timing_phase
    #todo

  end

  def do_strategy_phase
    #todo
  end

  def do_modifier_phase
    #todo
  end

  def do_resolution_phase
    #todo
  end


  def sort_players_by_timing(player_ara)

    player_hash = {}

    player_ara.each do |p|
      #roll a d12 dice to determine the timing of each player
      p.timing = p.agility + Dice.d12
#      puts "#{p.name} has a timing of #{p.timing}"
    end
    player_ara.sort {|b,a|a.timing <=> b.timing}
  end





end


