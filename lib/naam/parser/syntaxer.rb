module Naam

  # Public: Here we transform a list of lexical units in an AST.
  class Syntaxer

    def initialize
      @ast = AST.new "ast"
    end

    # Public: Compile lexical units from a Naam program in an AST.
    #
    # units - Array of LexicalUnits
    #
    # Returns the AST.
    def run units
      ProgramRule.new(units, @ast).apply!
      @ast
    end

  end
end
