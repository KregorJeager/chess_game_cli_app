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
  describe '#init_chesspiece' do
    context 'when a rook is created and placed in 0,0' do
      before do
        position = [0, 0]
        role = 'rook'
        team = 'white'
        board.init_chesspiece(role, position, team)
      end
      it 'role = rook' do
        piece = board.board[0][0]
        expect(piece.role).to eq('rook')
      end
      it 'team = white' do
        piece = board.board[0][0]
        expect(piece.team).to eq('white')
      end
    end
  end
end
