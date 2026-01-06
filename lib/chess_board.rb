# frozen_string_literal: false

require './lib/chess_piece'

# comment
class ChessBoard
  attr_reader :board
  attr_accessor :turn

  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
    @turn = 'white'
  end

  def init_chesspiece(role, pos, team)
    @board[pos[0]][pos[1]] = ChessPiece.new(role, team)
  end
end
