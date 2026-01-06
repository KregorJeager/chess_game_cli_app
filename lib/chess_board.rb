# frozen_string_literal: false

# comment
class ChessBoard
  attr_reader :board
  attr_accessor :turn

  def initialize
    @board = []
    @turn = 'white'
  end
end
