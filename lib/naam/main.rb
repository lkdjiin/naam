module Naam

  # Public: This is the entry point of the naam compiler.
  class Main

    # Public: run a naam program.
    #
    # filename - The String name of the naam program file.
    #
    # Returns nothing.
    def self.run(filename)
      raise ArgumentError unless Reader.naam_source_file?(filename)
      source_lines = Reader.read filename
      lexer = Parser::Lexer.new
      units = []

      source_lines.each do |line|
        tkr = Parser::Tokenizer.new(line)
        while tkr.has_more_token?
          units << lexer.from_token(tkr.next_token)
        end
      end

      comp = Compiler.new
      comp.compile(units.dup)
    end

  end

end
