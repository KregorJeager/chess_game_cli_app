# frozen_string_literal:false

require './lib/chess_piece'

describe ChessPiece do
  describe '#initialize' do
    context 'attributes can only be read' do
      subject(:piece) { described_class.new('pawn', 'white') }
      it 'does not allow role attr to change' do
        expect { piece.role = 'bishop' }.to raise_error(an_instance_of(NoMethodError))
      end
      it 'does not allow team attr to change' do
        expect { piece.team = 'white' }.to raise_error(an_instance_of(NoMethodError))
      end
      it 'does not allow character attr to change' do
        expect { piece.character = 'bishop' }.to raise_error(an_instance_of(NoMethodError))
      end
    end
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
    context 'rook' do
      let(:role) { String.new('rook') }
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
        expect(white_piece.character).to eq("\u2656")
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq("\u265C")
      end
    end
    context 'bishop' do
      let(:role) { String.new('bishop') }
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
        expect(white_piece.character).to eq('♗')
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq('♝')
      end
    end
    context 'knight' do
      let(:role) { String.new('knight') }
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
        expect(white_piece.character).to eq('♘')
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq('♞')
      end
    end
    context 'queen' do
      let(:role) { String.new('queen') }
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
        expect(white_piece.character).to eq('♕')
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq('♛')
      end
    end
    context 'king' do
      let(:role) { String.new('king') }
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
        expect(white_piece.character).to eq('♔')
      end
      it 'has black character attr' do
        expect(black_piece.character).to eq('♚')
      end
    end
  end
end
