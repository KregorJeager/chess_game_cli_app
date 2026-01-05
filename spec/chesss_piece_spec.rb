# frozen_string_literal:false

require './lib/chess_piece'

describe ChessPiece do
  describe '#initialize' do
    context 'pawn' do
      let(:role) { String.new('pawn') }
      let(:white) { String.new('white') }
      let(:black) { String.new('black') }
      subject(:white_piece) { described_class.new(role, white) }
      subject(:black_piece) { described_class.new(role, black) }
      it 'has role attr' do
        expect(white_piece.role).to eq(role)
      end
      it 'has team attr' do
        expect(white_piece.team).to eq(white)
      end
      it 'has white character attr' do
        expect(white_piece.character).to eq("\u2659")
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq("\u265F")
      end
    end
  end
end
