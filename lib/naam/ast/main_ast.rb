module Naam
  # Public: Represents a main function node. The main function is not in
  # Naam's grammar. This is an added node to more closely represent a
  # PIR source code.
  class MainAST < AST
    def initialize
      super("main")
    end
  end
end
