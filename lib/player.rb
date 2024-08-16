# player class
class Player
  AVAILIBLE_COLOURS = ["blue", "red", "green", "yellow", "purple", "orange"].freeze # rubocop:disable Style/WordArray

  attr_accessor :guesses_left

  def initialize
    @guesses_left = 12
  end

  def decrease_guesses
    @guesses_left -= 1
  end
end
