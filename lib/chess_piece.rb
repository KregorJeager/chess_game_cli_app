# frozen_string_literal:false

# Create an instance of a chesspiece given it's role and team
class ChessPiece
  attr_reader :role, :team, :character

  def initialize(role, team)
    @role = role
    @team = team
    @character = get_character(role, team)
  end

  def get_character(role, team)
    char = characters.select { |k, v| role == k }
    team == 'white' ? char[role].at(0) : char[role].at(1)
  end

  def characters
    { 'pawn' => ["\u2659", "\u265F"],
      'rook' => ["\u2656", "\u265C"],
      'bishop' => ["\u2657", "\u265D"],
      'knight' => ["\u2658", "\u265E"],
      'king' => ["\u2654", "\u265A"],
      'queen' => ["\u2655", "\u265B"] }
  end
end
