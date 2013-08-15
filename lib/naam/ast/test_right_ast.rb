module Naam
  # Public: Represents a test right part leaf node.
  class TestRightAST < AST
    def initialize value
      super("right value")
      @value = value
    end
  end
end

