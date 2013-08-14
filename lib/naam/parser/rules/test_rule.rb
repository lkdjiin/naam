module Naam
  # Public: Test rule. See Naam's grammar.
  class TestRule < BaseRule
    def apply!
      accept_series(:word, :op, :int)
      test_node = TestAST.new
      test_node.add_child(TestLeftAST.new(@series[0].value))
      test_node.add_child(TestOpAST.new(@series[1].value))
      test_node.add_child(TestRightAST.new(@series[2].value))
      @ast_node.add_child(test_node)
    end
  end
end
