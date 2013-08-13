module Naam::AST
  class FunctionHeaderArg < Node
    def initialize value
      super("arg")
      @value = value
    end
  end
end

