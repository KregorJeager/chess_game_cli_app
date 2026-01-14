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

  def path_clear?(path)
    path.pop
    return true if path.nil?

    path.all? { |i| @board[i[0]][i[1]].nil? }
  end

  def horizontal_move?(cur, new)
    cur[0] == new[0] || cur[1] == new[1]
  end

  def rook_valid?(cur, new)
    # finds postion between cur and new. Include new in return array
    path = rook_path(cur, new)
    # path_clear? checks if all item in array are nil
    return false if path.nil? || !path_clear?(path)

    piece = @board[new[0]][new[1]]
    piece.nil? || enemy?(new, piece.team)
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

  def bishop_valid?(cur, new)
    path = bishop_path(cur, new)
    return false if path.nil? || !path_clear?(path)

    piece = @board[new[0]][new[1]]
    piece.nil? || enemy?(new, piece.team)
  end

  def bishop_path(cur, new)
    return nil if invalid_diagonal?(cur, new)

    i_polar = cur[0] > new[0] ? -1 : 1
    j_polar = cur[1] > new[1] ? -1 : 1
    k = 0
    path = []
    until new == [cur[0] + k * i_polar, cur[1] + k * j_polar] || k > 7
      k += 1
      path << [cur[0] + k * i_polar, cur[1] + k * j_polar]
    end
    path
  end

  def invalid_diagonal?(cur, new)
    return true if horizontal_move?(cur, new)

    polars = find_diagonal_polars(cur, new)
    k = 0
    until out_of_board?(cur, k, polars[0], polars[1]) || k > 7
      k += 1
      return false if diagonal_valid(cur, new, k, polars)
    end
    true
  end

  def diagonal_valid(cur, new, count, polars)
    cur[0] + count * polars[0] == new[0] && cur[1] + count * polars[1] == new[1]
  end

  def find_diagonal_polars(cur, new)
    [cur[0] > new[0] ? -1 : 1, cur[1] > new[1] ? -1 : 1]
  end

  def out_of_board?(cur, k, i_polar, j_polar)
    cur[0] + k * i_polar > 7 || (cur[0] + k * i_polar).negative? ||
      cur[1] + k * j_polar > 7 || (cur[1] + k * j_polar).negative?
  end

  def knight_valid?(cur, new)
    path = knight_path(cur)
    path = knight_filter_team(path)
    path.include?(new)
  end

  def knight_filter_team(path)
    path.select! do |i|
      piece = @board[i[0]][i[1]]
      piece.nil? || enemy?(i, piece.team)
    end
  end

  def knight_path(cur)
    knight_template(cur).select do |pos|
      pos[0] < 8 && !pos[0].negative? &&
        pos[1] < 8 && !pos[1].negative?
    end
    # knight_template(cur)
  end

  def knight_template(cur)
    [[cur[0] - 2, cur[1] - 1],
     [cur[0] - 2, cur[1] + 1],
     [cur[0] - 1, cur[1] - 2],
     [cur[0] - 1, cur[1] + 2],
     [cur[0] + 2, cur[1] - 1],
     [cur[0] + 2, cur[1] + 1],
     [cur[0] + 1, cur[1] - 2],
     [cur[0] + 1, cur[1] + 2]]
  end
end
