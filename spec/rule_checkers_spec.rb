# frozen_string_literal: false

require './lib/rule_checkers'

describe RuleCheckers do
  subject(:checkers) { Class.new { extend(RuleCheckers) } }
end
