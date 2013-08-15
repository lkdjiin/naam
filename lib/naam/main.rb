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
      lexer = Lexer.new
      units = []

      source_lines.each do |line|
        tkr = Tokenizer.new(line)
        while tkr.has_more_token?
          units << lexer.from_token(tkr.next_token)
        end
      end

      syntaxer = Syntaxer.new
      ast = syntaxer.run(units.dup)

      organizer = Organizer.new(ast)
      ast = organizer.build_main_function
      ast.display
    end

  end

end
