module Naam
  # Public: Represents an argument leaf node.
  class ArgAST < AST
    def initialize value
      super("arg")
      @value = value
    end
  end
end

