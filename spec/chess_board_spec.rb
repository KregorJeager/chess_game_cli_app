# frozen_string_literal:false

require './lib/chess_board'

describe ChessBoard do
  describe 'instance variables' do
    subject(:board) { described_class.new }
    it 'has @board' do
      expect { board.board }.not_to raise_error
    end
    it '@board is read only' do
      expect { board.board = [1] }.to raise_error(an_instance_of(NoMethodError))
    end
  end
end
