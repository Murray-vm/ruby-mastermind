require_relative "human_player"
require_relative "computer_player"
require_relative "checks"

# Class to run the game player 1 sets the code player 2 guesses the code
class Game
  attr_accessor :player1, :player2

  def initialize
    @secret_code = []
    @guesses = []
    @game_over = false
  end

  def display_rules
    puts "before the game starts here are the rules:"
    puts "Player 1 will set a secret code with 4 pins from a selection of 6 colours: blue, red, green, yellow, purple or orange"
    puts "Player 2 will have 12 attempts to guess this code by entering their guess in order"
    puts "For every colour is guessed correctly a '+' will be displayed next to the guesses"
    puts "For every colour and it's position is guessed correctly a 'X' will be displayed next to the board"
    puts "Use these pins to crack the code"
    puts "Player 1 will win if the code is not cracked in under 12 moves"
    puts "Player 2 will win if the code is cracked within 12 attemps"
  end

  def pick_players
    puts ""
    puts "Do you want to be Player 1 (code master) or Player 2 (code cracker)?"
    puts "Input 'code master' to be Player 1 or press 'enter' to be be Player 2"
    human_selection = gets.chomp.downcase
    @player1 = human_selection == "code master" ? HumanPlayer.new : ComputerPlayer.new
    @player2 = human_selection == "code master" ? ComputerPlayer.new : HumanPlayer.new
    puts human_selection === "code master" ? "you are the code master" : "You are the code cracker"
    puts ""
  end

  def set_code
    puts "Player 1 will now set the code"
    @secret_code = @player1.place_pegs
    puts "The secret code is: ***shhh remove after testing****"
    p @secret_code
    puts "The secret code has been set:"
    puts ""
  end

  def won?(colours_matched)
    if colours_matched == 4
      @game_over = true
      puts "Congratulations player 2 has cracked the code won the game!"
      true
    else
      false
    end
  end

  def board_row(guess_array, guess_result)
    clue_pins = " "
    guess_result[:correct_position_count].times do
      clue_pins.concat("X")
    end
    clue_pins.concat(" ")
    guess_result[:correct_colours_count].times do
      clue_pins.concat("+")
    end
    guess_array.to_s.concat(clue_pins)
  end

  def make_guess
    if @guesses.length == 12
      @game_over = true
      puts "Player 2 has run out of attempts, Player 1 has won the game"
    else
      puts "Player 2, make your guess"
      pegs = player2.place_pegs
      guess_result = Checks.compare_codes(pegs, @secret_code)
      won?(guess_result[:correct_position_count])
      @guesses << board_row(pegs, guess_result)
    end
  end

  def display_board
    puts "The board right now:"
    @guesses.each do |guess|
      puts guess
    end
  end

  def start_game
    display_rules
    pick_players
    set_code
    until @game_over
      display_board
      puts ""
      make_guess
    end
  end
end
