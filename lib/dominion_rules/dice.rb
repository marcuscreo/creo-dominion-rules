class Dice
  attr_accessor :d12
  def self.d12
    Random.rand(1..12)
  end
end

