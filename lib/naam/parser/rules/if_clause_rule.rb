module Naam
  # Public: If clause rule. See Naam's grammar.
  class IfClauseRule < BaseRule
    def apply!
      if_node = IfClauseAST.new
      accept(:int)
      if_node.add_child(ReturnValueAST.new(@series[0].value))
      accept(:keyword, 'if')
      TestRule.new(@units, if_node).apply!
      accept(:eol)
      @ast_node.add_child(if_node)
    end
  end
end
