# frozen_string_literal:false

# Create an instance of a chesspiece given it's role and team
class ChessPiece
  attr_reader :role, :team, :character

  def initialize(role, team)
    @role = role
    @team = team
    @character = team == 'white' ? "\u2659" : "\u265F"
  end
end
