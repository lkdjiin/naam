module Naam::AST
  class FunctionHeaderName < Node
    def initialize value
      super("name")
      @value = value
    end
  end
end

