require_relative "player"

# human player class
class HumanPlayer < Player
  def initialize
    super
  end

  def valid_input?(input)
    return true if Player::AVAILIBLE_COLOURS.include?(input)

    puts "Please enter a valid colour: #{Player::AVAILIBLE_COLOURS}"
    false
  end

  def place_pegs
    pegs_array = Array.new(0)
    puts "Place your pegs by inputting the colours of your pegs in order"
    (0..3).each do |i|
      until valid_input?(pegs_array[i])

        puts "Peg ##{i + 1}"
        pegs_array[i] = gets.chomp
      end
    end
    pegs_array
  end
end
