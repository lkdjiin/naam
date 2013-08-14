module Naam
  # Public: Function definition rule. See Naam's grammar.
  class FunctionDefRule < BaseRule
    def apply!
      f_node = FunctionDefAST.new
      @ast_node.add_child f_node
      FunctionHeaderRule.new(@units, f_node).apply!
      IfClauseRule.new(@units, f_node).apply! while if_clause?
      ElseClauseRule.new(@units, f_node).apply!
    end

    private

    # Returns Boolean true if the next units form an if clause.
    def if_clause?
      @units[1].type == :keyword && @units[1].value == 'if'
    end

  end
end
