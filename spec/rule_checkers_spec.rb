# frozen_string_literal: false

require './lib/chess_board'

describe ChessBoard do
  describe 'RuleCheckers module' do
    subject(:checkers) { described_class.new }

    describe '#pawn_valid?' do
      it 'eats enemy on the sides' do
        current_position = [1, 0]
        new_position = [2, 1]
        output = [true, "moved pawn from #{current_position} to #{new_position}"]
        checkers.board[1][0] = ChessPiece.new('pawn', 'white')
        checkers.board[2][1] = ChessPiece.new('pawn', 'black')
        expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
      end
      context "pawn hasn't made a move yet" do
        it 'allows one step forward' do
          current_position = [1, 0]
          new_position = [2, 0]
          output = [true, "moved pawn from #{current_position} to #{new_position}"]
          checkers.board[1][0] = ChessPiece.new('pawn', 'white')
          expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
        end
        it 'allows two step forward' do
          current_position = [1, 0]
          new_position = [3, 0]
          output = [true, "moved pawn from #{current_position} to #{new_position}"]
          checkers.board[1][0] = ChessPiece.new('pawn', 'white')
          expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
        end
      end

      context 'pawn already made a move' do
        it 'only allows 1 step forward' do
          current_position = [2, 0]
          new_position = [4, 0]
          output = [false, 'Invalid move (only 1 step forward)']
          checkers.board[2][0] = ChessPiece.new('pawn', 'white')
          expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
        end
      end
      context 'work with black pieces' do
        it 'eats enemy on the sides' do
          current_position = [6, 0]
          new_position = [5, 1]
          output = [true, "moved pawn from #{current_position} to #{new_position}"]
          checkers.board[6][0] = ChessPiece.new('pawn', 'black')
          checkers.board[5][1] = ChessPiece.new('pawn', 'white')
          expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
        end
        context "pawn hasn't made a move yet" do
          it 'allows one step forward' do
            current_position = [6, 0]
            new_position = [4, 0]
            output = [true, "moved pawn from #{current_position} to #{new_position}"]
            checkers.board[6][0] = ChessPiece.new('pawn', 'black')
            expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
          end
          it 'allows two step forward' do
            current_position = [6, 0]
            new_position = [4, 0]
            output = [true, "moved pawn from #{current_position} to #{new_position}"]
            checkers.board[6][0] = ChessPiece.new('pawn', 'black')
            expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
          end
        end

        context 'pawn already made a move' do
          it 'only allows 1 step forward' do
            current_position = [5, 0]
            new_position = [3, 0]
            output = [false, 'Invalid move (only 1 step forward)']
            checkers.board[5][0] = ChessPiece.new('pawn', 'white')
            expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
          end
        end
      end
    end

    describe '#path_clear?' do
      let(:path) { [[1, 2], [1, 3], [1, 4]] }
      it 'returns true if all position except the last one is nil' do
        expect(checkers.path_clear?(path)).to eq(true)
      end
      it 'returns false if one position along the way has a piece' do
        checkers.board[1][3] = ChessPiece.new('pawn', 'white')
        expect(checkers.path_clear?(path)).to eq(false)
      end
    end
    describe '#rook_path' do
      context 'whan path is invalid' do
        it 'returns nil' do
          # diagoal move
          current_position = [1, 0]
          new_position = [3, 2]
          expect(checkers.rook_path(current_position, new_position)).to eq(nil)
        end
      end
      context 'vertical moves' do
        it 'returns a path from cur to new excluding cur position' do
          current_position = [4, 0]
          new_position = [6, 0]
          output = [[5, 0], [6, 0]]
          expect(checkers.rook_path(current_position, new_position)).to eq(output)
        end
        it 'Can return a path moving backwards' do
          current_position = [6, 0]
          new_position = [4, 0]
          output = [[5, 0], [4, 0]]
          expect(checkers.rook_path(current_position, new_position)).to eq(output)
        end
      end
      context 'horizontal moves' do
        it 'returns a path from cur to new excluding cur position' do
          current_position = [4, 0]
          new_position = [4, 4]
          output = [[4, 1], [4, 2], [4, 3], [4, 4]]
          expect(checkers.rook_path(current_position, new_position)).to eq(output)
        end
        it 'Can return a path moving backwards' do
          current_position = [4, 4]
          new_position = [4, 0]
          output = [[4, 3], [4, 2], [4, 1], [4, 0]]
          expect(checkers.rook_path(current_position, new_position)).to eq(output)
        end
      end
    end

    describe '#bishop_path' do
      it 'returns nil when move is invalid' do
        # horizontal move
        current_position = [0, 0]
        new_position = [3, 2]
        expect(checkers.bishop_path(current_position, new_position)).to eq(nil)
      end
      it 'works on diagonal descending to the right' do
        current_position = [0, 0]
        new_position = [4, 4]
        output = [[1, 1], [2, 2], [3, 3], [4, 4]]
        expect(checkers.bishop_path(current_position, new_position)).to eq(output)
      end
      it 'works on diagonal descending to the left' do
        current_position = [0, 5]
        new_position = [2, 3]
        output = [[1, 4], [2, 3]]
        expect(checkers.bishop_path(current_position, new_position)).to eq(output)
      end
      it 'works on diagonal ascending to the right' do
        current_position = [6, 0]
        new_position = [3, 3]
        output = [[5, 1], [4, 2], [3, 3]]
        expect(checkers.bishop_path(current_position, new_position)).to eq(output)
      end
      it 'works on diagonal ascending to the left' do
        current_position = [6, 6]
        new_position = [3, 3]
        output = [[5, 5], [4, 4], [3, 3]]
        expect(checkers.bishop_path(current_position, new_position)).to eq(output)
      end
    end

    describe '#knigh_path' do
      context 'return array of knight path coordinates' do
        it 'works with rand_pos = [0,0]' do
          rand_pos = [0, 0]
          output = [[1, 2], [2, 1]]
          expect(checkers.knigh_path(rand_pos)).to eq(output)
        end
      end
    end
  end
end
