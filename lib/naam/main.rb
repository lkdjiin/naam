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

      source_lines.each do |line|
        tkr = Parser::Tokenizer.new(line)
        while tkr.has_more_token?
          puts tkr.next_token
        end
      end
    end

  end

end
