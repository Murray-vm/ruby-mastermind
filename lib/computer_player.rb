require_relative "player"

# computer player class
class ComputerPlayer < Player
  def initialize
    super
  end

  def place_pegs
    pegs_array = Array.new(0)
    4.times do
      pegs_array << Player::AVAILIBLE_COLOURS[rand(6)]
    end
    pegs_array
  end
end
