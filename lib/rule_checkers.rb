# frozen_string_literal: false

module RuleCheckers
  def pawn_valid?(cur, new)
    i = cur[0]
    j = cur[1]
    piece = @board[i][j]
    polarity = piece.team == 'white' ? 1 : -1
    moves = [[i + 1 * polarity, j]]
    moves << [i + 1 * polarity, j - 1] if enemy?([i + 1 * polarity, j - 1], piece.team)
    moves << [i + 1 * polarity, j + 1] if enemy?([i + 1 * polarity, j + 1], piece.team)
    if (i == 1 && piece.team == 'white' || i == 6 && piece.team == 'black') && @board[i + 1 * polarity][j].nil?
      moves << [i + 2 * polarity, j]
    end

    moves.include?(new)
  end

  def enemy?(pos, team)
    piece = @board[pos[0]][pos[1]]
    return false if piece.nil?

    piece.team != team
  end
end
