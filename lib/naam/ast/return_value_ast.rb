module Naam
  class ReturnValueAST < AST
    def initialize value
      super("return value")
      @value = value
    end
  end
end

