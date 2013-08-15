module Naam
  # Public: Represents a print statement leaf node.
  # This is currently a leaf node, but not forever.
  class PrintStatementAST < AST
    def initialize value
      super("print statement")
      @value = value
    end
  end
end

