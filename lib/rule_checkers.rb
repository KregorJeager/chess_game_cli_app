# frozen_string_literal: false

module RuleCheckers
  def pawn_valid?(cur, new)
    i = cur[0]
    j = cur[1]
    piece = @board[i][j]
    return [[i + 1, j], [i + 2, j]].include?(new) if
    i == 1 && piece.team == 'white' || i == 6 && piece.team == 'black'

    [i + 1, j].include?(new)
  end

  def pawn_next_moves(cur)
  end
end
