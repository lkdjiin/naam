module Naam::AST
  class PrintStatement < Node
    def initialize value
      super("print statement")
      @value = value
    end
  end
end

