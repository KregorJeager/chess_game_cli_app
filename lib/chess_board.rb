# frozen_string_literal: false

# comment
class ChessBoard
  attr_reader :board
  attr_accessor :turn

  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
    @turn = 'white'
  end
end
