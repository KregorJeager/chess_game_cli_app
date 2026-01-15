# frozen_string_literal: false

require './lib/helper_modules/rook_helper'
require './lib/helper_modules/bishop_helper'
require './lib/helper_modules/knight_helper'

# Contain methods for validating moves
module RuleCheckers
  include RookHelper
  include BishopHelper
  include KnightHelper
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
    # can be found in helper_modules/rook_helper
    path = rook_path(cur, new)
    # path_clear? checks if all item in array are nil
    return false if path.nil? || !path_clear?(path)

    piece = @board[new[0]][new[1]]
    piece.nil? || enemy?(new, piece.team)
  end

  def bishop_valid?(cur, new)
    path = bishop_path(cur, new)
    return false if path.nil? || !path_clear?(path)

    piece = @board[new[0]][new[1]]
    piece.nil? || enemy?(new, piece.team)
  end

  def knight_valid?(cur, new)
    cur_team = @board[cur[0]][cur[1]].team
    path = knight_path(cur)
    path = knight_filter_team(path, cur_team)
    path.include?(new)
  end

  def queen_valid?(cur, new)
    return rook_valid?(cur, new) if horizontal_move?(cur, new)

    bishop_valid?(cur, new)
  end

  def king_valid?(cur, new)
    cur_team = @board[cur[0]][cur[1]].team
    path = king_path(cur)
    path = king_filter(path, cur_team)
    path.include?(new)
  end

  def king_path(cur)
    king_template(cur).select do |pos|
      pos[0] < 8 && !pos[0].negative? &&
        pos[1] < 8 && !pos[1].negative?
    end
  end

  def king_template(cur)
    i = cur[0]
    j = cur[1]

    [[i - 1, j - 1], [i - 1, j], [i - 1, j + 1],
     [i, j - 1], [i, j + 1],
     [i + 1, j - 1], [i + 1, j], [i + 1, j + 1]]
  end
end
