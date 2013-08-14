module Naam
  # Public: Print statement rule. See Naam's grammar.
  class PrintStatementRule < BaseRule
    def apply!
      accept(:keyword, 'print')
      accept_series(:word, :paro, :int, :parc, :eol)
      temp = @series[1].value + @series[2].value +
        @series[3].value + @series[4].value
      @ast_node.add_child(PrintStatementAST.new(temp))
    end
  end
end
