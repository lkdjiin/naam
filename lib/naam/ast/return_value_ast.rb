module Naam
  # Public: Represents a return node.
  class ReturnValueAST < AST
    def initialize value
      super("return value")
      @value = value
    end
  end
end

