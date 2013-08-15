module Naam
  # Public: Represents a name leaf node.
  class NameAST < AST
    def initialize value
      super("name")
      @value = value
    end
  end
end

