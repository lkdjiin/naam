module Naam
  # Public: Represents a test operator part leaf node.
  class TestOpAST < AST
    def initialize value
      super("op value")
      @value = value
    end
  end
end

