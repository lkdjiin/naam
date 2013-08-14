module Naam
  class NameAST < AST
    def initialize value
      super("name")
      @value = value
    end
  end
end

