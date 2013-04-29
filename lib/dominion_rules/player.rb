class Player
  attr_accessor :name, :agility, :current_roll

  def initialize(player_name,player_agility)
    @name = player_name
    @agility = player_agility
  end

  def timing
    @agility + current_roll
  end

end

