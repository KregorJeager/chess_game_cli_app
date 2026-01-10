# frozen_string_literal: false

module RuleCheckers
  def pawn_valid?(cur, new)
    i = cur[0]
    j = cur[1]
    piece = @board[cur[0]][cur[1]]
    if cur[0] == 1 && piece.team == 'white' || cur[0] == 6 && piece.team == 'black'
      return [[i + 1, j], [i + 2, j]].include?(new)
    end

    false
  end

  def pawn_next_moves(cur)
  end
end
