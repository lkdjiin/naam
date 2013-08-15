module Naam
  # Public: Else clause rule. See Naam's grammar.
  class ElseClauseRule < BaseRule
    def apply!
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
      @ast_node.add_child(else_node)
    end

    private

    def else_node
      node = ElseClauseAST.new
      node.add_child(ReturnValueAST.new(@series[0].value))
    end
  end
end

