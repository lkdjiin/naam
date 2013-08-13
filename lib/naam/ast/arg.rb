module Naam::AST
  class Arg < Node
    def initialize value
      super("arg")
      @value = value
    end
  end
end

