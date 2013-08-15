module Naam
  # Public: Represents a test left part leaf node.
  class TestLeftAST < AST
    def initialize value
      super("left value")
      @value = value
    end
  end
end

