module Naam
  # Public: Else clause rule. See Naam's grammar.
  class ElseClauseRule < BaseRule
    def apply!
      expr_node = ExprAST.new
      ExprRule.new(@units, expr_node).apply!
      accept(:keyword, 'else')
      accept(:eol)
      else_node = ElseClauseAST.new
      else_node.add_child(expr_node)
      @ast_node.add_child(else_node)
    end

  end
end

