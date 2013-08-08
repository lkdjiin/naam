module Naam
  class Compiler

    # units - Array of LexicalUnits
    #
    # Returns ?
    def compile units
      @units = units
      program
    end

    private

    def program
      while @units.size > 0
        case @units.first.type
        when :eol then accept(:eol)
        else
          instruction
        end
      end
    end

    def instruction
      case @units.first.type
      when :keyword then print_statement
      when :word then function_def
      else
        raise Error
      end
    end

    def print_statement
      accept(:keyword, 'print')
      accept_series(:word, :paro, :int, :parc, :eol)
    end

    def function_def
      accept_series(:word, :paro, :word, :parc, :affect, :eol)
      if_clause while if_clause?
      else_clause
    end

    def if_clause
      accept(:int)
      accept(:keyword, 'if')
      test
      accept(:eol)
    end

    def else_clause
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
    end

    def test
      accept_series(:word, :op, :int)
    end

    def accept(type, value = '')
      unit = @units.slice!(0)
      raise Error unless unit.type == type
      if value != ''
        raise Error unless unit.value == value
      end
    end

    def accept_series(*args)
      args.each {|arg| accept(arg) }
    end

    def if_clause?
      @units[1].type == :keyword && @units[1].value == 'if'
    end
  end
end
