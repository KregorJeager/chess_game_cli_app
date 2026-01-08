# frozen_string_literal: false

module RuleCheckers
  def pawn_valid?(cur, new)
    [true, "moved pawn from #{cur} to #{new}"]
  end
end
