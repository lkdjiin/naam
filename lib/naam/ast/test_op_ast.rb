module Naam
  class TestOpAST < AST
    def initialize value
      super("op value")
      @value = value
    end
  end
end

