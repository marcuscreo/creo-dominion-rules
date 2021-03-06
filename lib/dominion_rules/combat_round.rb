class CombatRound

  module TimingValues
    LAST_PLACE=-1
  end

  def initialize
    @player_hash = Hash.new
    @player_timing_order = Array.new
  end

  def add_player(player)
    @player_hash[player.name] = player
  end

  def get_player_by_name(name)
    @player_hash[name]
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
      roll = p.dice.d12

      #puts "#{p.name} has agility of #{p.agility} and a roll of #{roll} for a timing of #{p.agility + roll.to_i}"

      #Rolling a 12 puts you LAST
      if roll == 12
        p.timing = TimingValues::LAST_PLACE
      else
        p.timing = p.agility + roll.to_i
      end

      #puts "roll = #{roll}, name=#{p.name}, agility=#{p.agility}, timing=#{p.timing}"
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
    #debugger

    #Sort the array, but leave it in a hash with the appropriate keys
    timing_hash = Hash[timing_hash.sort]

    #flatten array, which already sorts it????
    sorted_player_array = Array.new
    timing_hash.each do |timing,value|
      if value.class == Array
        value.each do |player|
          sorted_player_array << player
        end
      end
    end

    sorted_player_array
  end
end