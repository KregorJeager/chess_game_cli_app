# frozen_string_literal: false

require './lib/chess_board'
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
    print_board
    loop do
      print "#{@chess.turn} to move; enter move here =>"
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

  def coordinate_format?(str)
    return false unless str.length == 7

    coor?(str[0]) && str[1] == ',' && coor?(str[2]) && str[3] == '|' &&
      coor?(str[4]) && str[5] == ',' && coor?(str[6])
  end

  def coor?(str)
    %w[0 1 2 3 4 5 6 7].include?(str)
  end

  def print_board
    puts '  0   1   2   3   4   5   6   7'
    @chess.board.each_index do |i|
      line = []
      @chess.board[i].each do |j|
        line << (j.nil? ? '[  ]' : "[#{j.character} ]")
      end
      puts "#{i}#{line.join('')}"
    end
  end
end
