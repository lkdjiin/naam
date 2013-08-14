module Naam
  class PrintStatementAST < AST
    def initialize value
      super("print statement")
      @value = value
    end
  end
end

