module Naam

  # Internal: All about naam source files.
  module Reader

    # Public: Tells if a filename is a naam source file or not.
    #
    # filename - String filename to test.
    #
    # Returns Boolean.
    def self.naam_source_file?(filename)
      filename.match /.naam$/ and File.exist? filename
    end

    # Public: Get naam source as an array of lines.
    #
    # filename - The String source filename (with «.naam» extension).
    #
    # Returns an Array of String.
    def self.read(filename)
      IO.readlines(filename)
    end
    
  end

end
