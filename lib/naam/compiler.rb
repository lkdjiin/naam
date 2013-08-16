module Naam

  # Public: Compiler is the main class of Naam.
  class Compiler

    # Public: Initialize a new Compiler.
    #
    # filename - String name of the file to compile.
    #
    # Raises ArgumentError if filename doesn't resolve into a
    #   valid Naam source file.
    def initialize filename
      @filename = filename
      @units = []
      @ast = nil
      raise ArgumentError unless Reader.naam_source_file?(@filename)
    end

    # Public: Write a PIR file.
    #
    # filename - The String name of the naam program file.
    #
    # Returns nothing.
    def compile
      lexify
      syntaxify
      organize
      emit
    end

    private

    def lexify
      source_lines = Reader.read @filename
      lexer = Lexer.new

      source_lines.each do |line|
        tkr = Tokenizer.new(line)
        @units << lexer.from_token(tkr.next_token) while tkr.has_more_token?
      end
    end

    def syntaxify
      syntaxer = Syntaxer.new
      @ast = syntaxer.run(@units.dup)
    end

    def organize
      organizer = Organizer.new(@ast)
      @ast = organizer.reorganize
    end

    def emit
      emitter = Emitter.new(@ast)
      pir_code = emitter.pir_code
      out_name = File.dirname(File.expand_path(@filename)) + "/out.pir"
      File.write out_name, pir_code
    end
  end

end
