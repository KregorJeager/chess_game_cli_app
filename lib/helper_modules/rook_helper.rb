# frozen_string_literal: false

# commment
module RookHelper
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
