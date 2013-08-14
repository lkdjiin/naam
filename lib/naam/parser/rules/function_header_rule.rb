module Naam
  # Public: Function header rule. See Naam's grammar.
  class FunctionHeaderRule < BaseRule
    def apply!
      accept_series(:word, :paro, :word, :parc, :affect, :eol)
      f_header = FunctionHeaderAST.new
      f_header.add_child(NameAST.new(@series[0].value))
      f_header.add_child(ArgAST.new(@series[2].value))
      @ast_node.add_child(f_header)
    end
  end
end
