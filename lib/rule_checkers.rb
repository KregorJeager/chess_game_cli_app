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

  def rook_valid?(cur, new)
    path = rook_path(cur, new)
    return false if path.nil? || !path_clear?(path)

    piece = @board[new[0]][new[1]]
    piece.nil? || enemy?(new, piece.team)
  end

  def path_clear?(path)
    path.pop
    return true if path.nil?

    path.all? { |i| @board[i[0]][i[1]].nil? }
  end

  def rook_path(cur, new)
    # straight moves should have one common coordinate
    return nil unless cur[0] == new[0] || cur[1] == new[1]

    # returns 0 or 1, depends on which axis is moving | cur[axis0][axis1]
    axis = rook_axis(cur, new)
    # return + or - 1, depends when we need to add or subtrct from cur to
    # reach new
    polarity = rook_polarity(cur, new, axis)
    path = []
    until cur[axis] == new[axis]
      cur[axis] += 1 * polarity
      path << [cur[0], cur[1]]
    end
    path
  end

  def rook_axis(cur, new)
    cur[0] == new[0] ? 1 : 0
  end

  def rook_polarity(cur, new, axis)
    cur[axis] > new[axis] ? -1 : 1
  end
end
