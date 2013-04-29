class CombatRound

  def initialize
    @player_hash = Hash.new
  end

  def add_player(player)
    @player_hash[player.name] = player
  end

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
    retlist = Array.new
    @player_hash.each do |key,player|
      retlist << player
    end
    retlist
  end


  def get_players_by_timing(dice)
    timing_ara = sort_players_by_timing(@player_hash.values)



    #@sorted_players =
    #
    ##I don't love Ruby's syntax here, but to sort descending do b,a
    #@sorted_players.sort! do |b,a|
    #  a.timing <=> b.timing
    #end
  end

  def sort_players_by_timing(player_ara)

    player_hash = {}

    player_ara.each do |p|
      #get roll

      if player_hash[p.timing]
        player_hash[p.timing] = player_hash[p.timing] + [p]
      else
        player_hash[p.timing] = [p]
      end
    end

    player_hash = player_hash.sort {|a,b|b <=> a}

    #deal with ties

    player_hash.each do |key,player_array|
      if player_array.length > 1
        player_hash[player_array[0].timing] = sort_players_by_timing(player_array)
      end
    end
    puts "Player Hash = "
    puts player_hash

    foo = player_hash.map {|key,value| value}.flatten

    puts "Foo = "
    puts foo

    foo
  end





end


