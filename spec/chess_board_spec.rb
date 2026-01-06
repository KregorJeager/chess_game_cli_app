# frozen_string_literal:false

require './lib/chess_board'

describe ChessBoard do
  subject(:board) { described_class.new }
  describe 'instance variables' do
    it 'has @board' do
      expect { board.board }.not_to raise_error
    end
    it '@board is read only' do
      expect { board.board = [1] }.to raise_error(an_instance_of(NoMethodError))
    end
    it 'has @turn' do
      expect(board.turn).to eq('white')
    end
    it '@turn has attr accesor' do
      expect { board.turn = 'black' }.to change { board.turn }.to('black')
    end
  end

  describe '#initialize' do
    matcher :be_a_nil_8x8_array do
      match do |brd|
        (0..7).each do |i|
          (0..7).each do |j|
            brd[i][j].nil?
          end
        end
      end
    end
    it 'set @board to 8x8 2d array with all values nil' do
      expect(board.board).to be_a_nil_8x8_array
    end
  end
end
