# frozen_string_literal:false

require './lib/chess_piece'

describe ChessPiece do
  describe '#initialize' do
    context 'pawn' do
      let(:role) { String.new('pawn') }
      let(:team) { String.new('white') }
      subject(:pawn) { described_class.new(role, team) }
      it 'has role attr' do
        expect(pawn.role).to eq(role)
      end
    end
  end
end
