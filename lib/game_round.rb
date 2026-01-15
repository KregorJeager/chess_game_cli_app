# frozen_string_literal: false

require 'lib/chess_board'
# comment
class GameRound
  def initialize
  end

  def player_input
    filter_input(gets.chomp)
  end

  def filter_input(input)
    if coordinate_format?(input)
      input = input.split('|')
      return [input[0].split(',').map!(&:to_i), input[1].split(',').map!(&:to_i)]
    end
    input
  end
end
