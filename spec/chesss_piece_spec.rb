# frozen_string_literal:false

require './lib/chess_piece'

describe ChessPiece do
  describe '#initialize' do
    context 'pawn' do
      let(:role) { String.new('pawn') }
      let(:white) { String.new('white') }
      let(:black) { String.new('black') }
      subject(:pawn) { described_class.new(role, white) }
      it 'has role attr' do
        expect(pawn.role).to eq(role)
      end
      it 'has team attr' do
        expect(pawn.team).to eq(white)
      end
      it 'has white character attr' do
        expect(pawn.character).to eq("\u2659")
      end
    end
  end
end
