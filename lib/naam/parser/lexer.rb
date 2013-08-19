module Naam

  # Public: A class to lexify.
  class Lexer

    def op?
      ['<', '>', '+', '-', '*', '/', '%'].include? @token
    end

    def keyword?
      ['if', 'else', ';', 'print'].include? @token
    end

    def int?
      @token =~ /\A[+|-]?\d+\z/
    end

    # Public: Build a LexicalUnit from a given token.
    #
    # token - A String token to transform in LexicalUnit.
    #
    # Returns a LexicalUnit.
    def from_token token
      @token = token
      if token == '('
        LexicalUnit.paro()
      elsif token == ')'
        LexicalUnit.parc()
      elsif token == "\n"
        LexicalUnit.eol()
      elsif token == '->'
        LexicalUnit.affect()
      elsif op?
        LexicalUnit.op(@token)
      elsif keyword?
        to_keyword
      elsif int?
        LexicalUnit.int(token)
      else
        LexicalUnit.word(token)
      end
    end

    private

    def to_keyword
      @token = 'else' if @token == ';'
      LexicalUnit.keyword(@token)
    end
  end
end
