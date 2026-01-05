# frozen_string_literal:false

# Create an instance of a chesspiece given it's role and team
class ChessPiece
  attr_reader :role

  def initialize(role, team)
    @role = role
  end
end
