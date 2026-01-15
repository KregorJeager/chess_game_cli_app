# frozen_string_literal: false

# contains methods for bishop_valid?
module BishopHelper
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
end
