module Naam::AST
  class TestRight < Node
    def initialize value
      super("right value")
      @value = value
    end
  end
end

