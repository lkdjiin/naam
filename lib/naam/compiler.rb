module Naam

  # Public: Here we transform a list of lexical units in a PIR source
  # code. At least this is the goal.
  #
  # The logic of this class try follow the grammar of Naam (see the file
  # grammar.md).
  class Compiler

    def initialize
      @series = []
      @current_label = "LABEL0000"
      @labels = []
      @main = []
    end

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
        @series = []
        case @units.first.type
        when :eol then accept(:eol)
        else
          instruction
        end
      end
      @labels.each {|lbl| emit(:label, lbl) }
      emit(:function_footer)
      Emitter.main(@main)
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
      @main << "#{@series[1].value}(#{@series[3].value})"
      @series = []
    end

    # Returns nothing.
    def function_def
      accept_series(:word, :paro, :word, :parc, :affect, :eol)
      emit(:function_header)
      if_clause while if_clause?
      else_clause
    end

    # Returns nothing.
    def if_clause
      accept(:int)
      accept(:keyword, 'if')
      test
      accept(:eol)
      emit(:if_clause, next_label(@series[0].value))
    end

    # Returns nothing.
    def else_clause
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
      emit(:else_clause)
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
      @series << unit
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

    # Send a message to Emitter module.
    #
    # type  - A Symbol (see Emitter).
    # label - A Hash composed of:
    #         :label - The label name as a String.
    #         :value - The String value that will be returned by
    #                  PIR instructions for this label.
    #         By default, label is nil and unused.
    #
    # Returns nothing.
    def emit(type, label = nil)
      Emitter.emit(type, @series, label)
      @series = []
    end

    # Get a label.
    #
    # value - String value associated to the label.
    #
    # Examples
    #
    #   next_label("123")
    #   # => { label: "LABEL0000", value: "123" }
    #   next_label("-9")
    #   # => { label: "LABEL0001", value: "-9" }
    #
    # Returns the Hash label.
    def next_label(value)
      temp = { label: @current_label, value: value }
      @labels << temp
      @current_label = @current_label.next
      temp
    end
  end
end
