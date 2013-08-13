module Naam::AST
  class TestOp < Node
    def initialize value
      super("op value")
      @value = value
    end
  end
end

