class Player
  attr_accessor :name, :agility, :timing, :dice

  def initialize(player_name)
    @name = player_name
    @dice = Dice.new
  end

  def set_attribute(attribute,value)
    if attribute == "agility"
      @agility = value.to_i
    end
  end

end

