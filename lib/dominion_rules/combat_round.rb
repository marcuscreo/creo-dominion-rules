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

    #Roll the dice and assign the timing
    in_player_array.each do |p|
      #roll a d12 dice to determine the timing of each player
      roll = Dice.d12

      #Rolling a 12 puts you LAST
      if roll == 12
        p.timing = "last"
      else
        p.timing = p.agility + roll
      end
    end

    #create the timing_hash
    in_player_array.each do |p|
      if timing_hash[p.timing].nil?
        timing_hash[p.timing] = Array.new
      end
      timing_hash[p.timing] << p
    end


    #Resolve ties
    timing_hash.each do |timing,player_sub_array|
      if player_sub_array.length > 1
        timing_hash[timing] = sort_players_by_timing(player_sub_array)
      end
    end
    debugger


    #Sort the array, but leave it in a hash with the appropriate keys
    timing_hash = Hash[timing_hash.sort]



    ##flatten array, which already sorts it????
    sorted_player_array = Array.new

    timing_hash.each do |timing,value|
      #print "Value = #{value}\n"
      if value.class == Array
        value.each do |player|
          sorted_player_array << player
        end
      else
        sorted_player_array << value
      end
    end

    sorted_player_array

  end


end