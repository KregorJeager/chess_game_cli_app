# frozen_string_literal:false

require './lib/chess_board'

describe ChessBoard do
  describe 'instance variables' do
    subject(:board) { described_class.new }
    it 'has @board' do
      expect(board.board).not_to raise_error
    end
  end
end
