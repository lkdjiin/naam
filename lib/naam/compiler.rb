module Naam

  # Public: Here we transform a list of lexical units in a PIR source_lines
  # code. At least this is the goal.
  #
  # The logic of this class follow the grammar of Naam (see the filename
  # grammar.md).
  class Compiler

    # Public: Compile lexical units from a Naam program in a PIR
    # program.
    #
    # units - Array of LexicalUnits
    #
    # Returns nothing.
    def compile units
      @units = units
      program
    end

    private

    # This is the entry rule.
    #
    # Returns nothing.
    def program
      while @units.size > 0
        case @units.first.type
        when :eol then accept(:eol)
        else
          instruction
        end
      end
    end

    # Returns nothing.
    # Raises an error if the next units doesn't form an Naam's
    #   instruction.
    def instruction
      case @units.first.type
      when :keyword then print_statement
      when :word then function_def
      else
        raise Error
      end
    end

    # Returns nothing.
    def print_statement
      accept(:keyword, 'print')
      accept_series(:word, :paro, :int, :parc, :eol)
    end

    # Returns nothing.
    def function_def
      accept_series(:word, :paro, :word, :parc, :affect, :eol)
      if_clause while if_clause?
      else_clause
    end

    # Returns nothing.
    def if_clause
      accept(:int)
      accept(:keyword, 'if')
      test
      accept(:eol)
    end

    # Returns nothing.
    def else_clause
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
    end

    # Returns nothing.
    def test
      accept_series(:word, :op, :int)
    end

    # Accepts the next lexical unit, given type match the unit type.
    # If value is given, it has to match the unit value.
    #
    # type  - Expected Symbol type of the next unit.
    # value - Expected String value of the next unit. Default is the
    #         empty string, meaning the value doesn't matter.
    #
    # Returns nothing.
    # Raises an error if type (and maybe value) doesn't match.
    def accept(type, value = '')
      unit = @units.slice!(0)
      raise Error unless unit.type == type
      if value != ''
        raise Error unless unit.value == value
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

    # Returns Boolean true if the next units form an if clause.
    def if_clause?
      @units[1].type == :keyword && @units[1].value == 'if'
    end
  end
end
