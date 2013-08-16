module Naam
  # Public: Represents a function footer node. Function footer is not
  # part of Naam's grammar. It's added to ease compiling process.
  class FunctionFooterAST < AST
    def initialize
      super("footer")
    end
  end
end

