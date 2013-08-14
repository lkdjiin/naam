module Naam
  # Public: Else clause rule. See Naam's grammar.
  class ElseClauseRule < BaseRule
    def apply!
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
      else_node = ElseClauseAST.new
      else_node.add_child(ReturnValueAST.new(@series[0].value))
      @ast_node.add_child(else_node)
    end
  end
end

