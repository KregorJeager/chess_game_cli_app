# frozen_string_literal: false

require 'lib/chess_board'
# comment
class GameRound
  def initialize(chess)
    @chess = chess
  end

  def game_loop
    make_move(@chess)
    @chess.turn = @chess.turn == 'white' ? 'black' : 'white'
  end

  def make_move(board)
    loop do
      input = player_input
      return @chess.move_piece(input[0], input[1]) if @chess.valid?(input[0], input[1])

      puts 'Invalid input'
    end
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
