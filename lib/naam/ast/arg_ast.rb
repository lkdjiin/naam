module Naam
  class ArgAST < AST
    def initialize value
      super("arg")
      @value = value
    end
  end
end

