module Naam
  # Public: Test rule. See Naam's grammar.
  class TestRule < BaseRule
    def apply!
      accept_series(:word, :op, :int)
      @ast_node.add_child(test_node)
    end

    private

    def test_node
      node = TestAST.new
      node.add_child(TestLeftAST.new(@series[0].value))
      node.add_child(TestOpAST.new(@series[1].value))
      node.add_child(TestRightAST.new(@series[2].value))
    end
  end
end
