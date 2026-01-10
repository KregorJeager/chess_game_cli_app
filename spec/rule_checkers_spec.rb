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
  end
end
