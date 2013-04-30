class CombatRound

  #good
  def initialize
    @player_hash = Hash.new
    @player_timing_order = Array.new
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
    @player_timing_order
  end

  def do_timing_phase
    @player_timing_order = sort_players_by_timing(@player_hash.values)
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


  def sort_players_by_timing(in_player_array)
    timing_hash = Hash.new

    in_player_array.each do |p|
      #roll a d12 dice to determine the timing of each player
      roll = Dice.d12

      #Rolling a 12 puts you LAST
      if roll == 12
        p.timing = 99
      else
        p.timing = p.agility + roll
      end

      if timing_hash[p.timing].nil?
        timing_hash[p.timing] = [p]
      else
        timing_hash[p.timing] << p
      end

    end

    #Resolve ties
    timing_hash.each do |key,value|
      if value.length > 1
        timing_hash[key] = sort_players_by_timing(value)
      end
    end

    #flatten array, which already sorts it????
    sorted_player_array = Array.new
    timing_hash.each do |key,value|
      if value.class == Array
        value.each do |player|
          sorted_player_array << player
        end
      else
        sorted_player_array << value
      end
    end


  end


end