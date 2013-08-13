module Naam::AST
  class TestLeft < Node
    def initialize value
      super("left value")
      @value = value
    end
  end
end

