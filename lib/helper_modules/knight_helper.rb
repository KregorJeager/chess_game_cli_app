# frozen_string_literal: false

# Contains sub methods for knight_valid?
module KnightHelper
  def filter_team(path, team)
    path.select! do |i|
      piece = @board[i[0]][i[1]]
      piece.nil? || enemy?(i, team)
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
