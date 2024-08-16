# Module with functions to check player guesses
module Checks
  def self.correct_colours(guess_array, code_array)
    matched_colours = []
    guess_array.each do |guess_pin|
      code_array.each_with_index do |code_pin, index|
        next unless guess_pin == code_pin && !matched_colours.include?(index)

        matched_colours << index
        break
      end
    end
    matched_colours.length
  end

  def self.correct_positions(guess_array, code_array)
    correct = 0
    guess_array.each_with_index do |guess_pin, index|
      correct += 1 if guess_pin == code_array[index]
    end
    correct
  end

  def self.compare_codes(guess_array, code_array)
    return { correct_position_count: 4, correct_colours_count: 0 } if guess_array == code_array

    correct_position_count = correct_positions(guess_array, code_array)
    correct_colours_count = correct_colours(guess_array, code_array) - correct_position_count
    { correct_position_count:, correct_colours_count: }
  end
end
