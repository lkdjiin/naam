module Naam
  # Public: Function definition rule. See Naam's grammar.
  class FunctionDefRule < BaseRule
    def apply!
      f_node = FunctionDefAST.new
      @ast_node.add_child f_node
      FunctionHeaderRule.new(@units, f_node).apply!
      IfClauseRule.new(@units, f_node).apply! while BaseRule.if_clause?(@units)
      ElseClauseRule.new(@units, f_node).apply!
    end
  end
end
