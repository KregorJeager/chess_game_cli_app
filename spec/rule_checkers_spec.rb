# frozen_string_literal: false

require './lib/chess_board'

describe ChessBoard do
  describe 'RuleCheckers module' do
    subject(:checkers) { described_class.new }

    describe '#pawn_valid?' do
      it 'allows two step forward on first move' do
        current_position = [1, 0]
        new_position = [3, 0]
        output = [true, "moved pawn from #{current_position} to #{new_position}"]
        expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
      end

      it 'only allows 1 step forward after the initial move' do
        current_position = [2, 0]
        new_position = [4, 0]
        output = [false, 'Invalid move (only 1 step forward)']
        expect(checkers.pawn_valid?(current_position, new_position)).to eq(output[0])
      end
    end
  end
end
