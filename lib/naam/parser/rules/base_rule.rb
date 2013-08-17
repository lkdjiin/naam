module Naam

  # Public: Base class for a rule of grammar. The goal of a rule is
  # to transform lexical units into an AST.
  class BaseRule

    # Public: Returns Boolean true if the next units form an if clause.
    def self.if_clause?(units)
      unit = units[1]
      unit.type == :keyword && unit.value == 'if'
    end

    # Public: Initialize a new rule. The units and ast_node objects
    # given in arguments will be modified by #apply!.
    #
    # units    - Array of LexicalUnits.
    # ast_node - An AST object, for adding children, etc.
    def initialize(units, ast_node)
      @units = units
      @ast_node = ast_node
      @series = []
    end

    # Public: Apply the rule to the list of lexical units, creating
    # and/or modifying the ast node. #apply! modify the units and
    # ast_node objects given to #initialize.
    def apply!
      raise NotImplementedError
    end

    private

    # Accepts the next lexical unit, given type match the unit type.
    # If value is given, it has to match the unit value.
    #
    # type  - Expected Symbol type of the next unit.
    # value - Expected String value of the next unit. Default is the
    #         empty string, meaning the value doesn't matter.
    #
    # Returns nothing.
    # Raises BadLexemeError if type or value doesn't match.
    def accept(type, value = '')
      unit = @units.slice!(0)
      @series << unit
      unless unit.type == type
        raise(BadLexemeError,
          "Expected: (#{type}, #{value}), got: (#{unit.type}, #{unit.value})")
      end
      if value != ''
        raise BadLexemeError unless unit.value == value
      end
    end

    # A shortcut method to #accept. Usefull when we have several calls
    # to #accept. Calls #accept for each of the symbol in args.
    #
    # args - A series of Symbol.
    #
    # Returns nothing.
    def accept_series(*args)
      args.each {|arg| accept(arg) }
    end

  end
end

