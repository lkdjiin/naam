module Naam::AST
  class ReturnValue < Node
    def initialize value
      super("return value")
      @value = value
    end
  end
end

