# frozen_string_literal: false

require './lib/chess_piece'
require './lib/rule_checkers'

# comment
class ChessBoard
  include RuleCheckers
  attr_reader :board
  attr_accessor :turn

  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
    @turn = 'white'
  end

  def init_chesspiece(role, pos, team)
    @board[pos[0]][pos[1]] = ChessPiece.new(role, team)
  end

  def set_board_to_default
    set_pawns
    set_rook_knight_bishop
    set_royals
  end

  def move_piece(cur, new)
    @board[new[0]][new[1]] = @board[cur[0]][cur[1]]
    @board[cur[0]][cur[1]] = nil
  end

  def set_pawns
    (0..7).each do |i|
      @board[1][i] = ChessPiece.new('pawn', 'white')
      @board[6][i] = ChessPiece.new('pawn', 'black')
    end
  end

  def set_rook_knight_bishop
    [0, 7].each do |i|
      team = i.zero? ? 'white' : 'black'
      [0, 7].each { |j| @board[i][j] = ChessPiece.new('rook', team) }
      [1, 6].each { |j| @board[i][j] = ChessPiece.new('knight', team) }
      [2, 5].each { |j| @board[i][j] = ChessPiece.new('bishop', team) }
    end
  end

  def set_royals
    @board[0][3] = ChessPiece.new('king', 'white')
    @board[0][4] = ChessPiece.new('queen', 'white')
    @board[7][3] = ChessPiece.new('king', 'black')
    @board[7][4] = ChessPiece.new('queen', 'black')
  end
end
