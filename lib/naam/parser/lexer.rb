module Naam::Parser
  class Lexer
    def from_token token
      if token == '('
        LexicalUnit.paro()
      elsif token == ')'
        LexicalUnit.parc()
      elsif token == "\n"
        LexicalUnit.eol()
      elsif token == '='
        LexicalUnit.affect()
      elsif token == '<'
        LexicalUnit.op(token)
      elsif token == '>'
        LexicalUnit.op(token)
      elsif token == 'if'
        LexicalUnit.keyword(token)
      elsif token == 'else'
        LexicalUnit.keyword(token)
      elsif token =~ /[+|-]?\d+/
        LexicalUnit.int(token)
      else
        LexicalUnit.word(token)
      end
    end
  end
end
