module Naam
  # Public: If clause rule. See Naam's grammar.
  class IfClauseRule < BaseRule
    def apply!
      accept(:int)
      accept(:keyword, 'if')
      @ast_node.add_child(if_node)
    end

    private

    def if_node
      node = IfClauseAST.new
      node.add_child(ReturnValueAST.new(@series[0].value))
      TestRule.new(@units, node).apply!
      accept(:eol)
      node
    end
  end
end
