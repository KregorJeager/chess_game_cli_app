# frozen_string_literal: false

module RuleCheckers
  def pawn_valid?(cur, new)
    i = cur[0]
    j = cur[1]
    piece = @board[i][j]
    moves = [[i + 1, j]]
    moves << [i + 1, j - 1] if enemy?([i + 1, j - 1], piece.team)
    moves << [i + 1, j + 1] if enemy?([i + 1, j + 1], piece.team)
    if i == 1 && piece.team == 'white' || i == 6 && piece.team == 'black'
      moves << [i + 2, j]
      return moves.include?(new)
    end

    moves.include?(new)
  end

  def enemy?(pos, team)
    piece = @board[pos[0]][pos[1]]
    return false if piece.nil?

    piece.team != team
  end

  def pawn_next_moves(cur)
  end
end
