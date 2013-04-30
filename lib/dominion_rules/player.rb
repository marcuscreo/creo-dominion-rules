class Player
  attr_accessor :name, :agility, :timing

  def initialize(player_name)
    @name = player_name
  end

  def set_attribute(attribute,value)
    if attribute == "agility"
      @agility = value.to_i
    end
  end
end

