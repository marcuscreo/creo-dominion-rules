class Dice
  def self.d12
    Random.rand(1..12)
  end

  @curr_roll_ptr=0
  @rolls=[]
  def store_sequence(rolls_sequence)
    @rolls = rolls_sequence
  end

  def next_d12_roll
    curr_index = @curr_roll_ptr
    @curr_roll_ptr += 1
    @rolls[curr_index]
  end

  def reset_rolls
    @curr_roll_ptr=0
    @rolls = []
  end

end

