module Naam::Parser

  # A container for lexical units.
  class LexicalUnit

    private_class_method :new

    attr_reader :type, :value

    # type  - Symbol
    # value - String
    def initialize type, value
      @type = type
      @value = value
    end

    def self.int value ; new(:int, value) ; end

    def self.word value ; new(:word, value) ; end

    def self.keyword value ; new(:keyword, value) ; end

    def self.op value ; new(:op, value) ; end

    def self.paro ; new(:paro, "(") ; end

    def self.parc ; new(:parc, ")") ; end

    def self.eol ; new(:eol, "\n") ; end

    def self.affect ; new(:affect, "=") ; end
  end

end
