module Naam::Parser

  # Public: Here we transform a list of lexical units in an AST.
  #
  # The logic of this class try follow the grammar of Naam (see the file
  # grammar.md).
  class Syntaxer

    def initialize
      @series = []
      @main = []
      @ast = Naam::AST::Program.new
    end

    # Public: Compile lexical units from a Naam program in an AST.
    #
    # units - Array of LexicalUnits
    #
    # Returns the AST.
    def run units
      @units = units
      program
      @ast
    end

    private

    # This is the entry rule.
    #
    # Returns nothing.
    def program
      while @units.size > 0
        case @units.first.type
        # When catched here, an end of line is not significant.
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
      @series = []
      accept(:keyword, 'print')
      accept_series(:word, :paro, :int, :parc, :eol)
      temp = @series[1].value + @series[2].value + @series[3].value +
        @series[4].value 
      @ast.add_child(Naam::AST::PrintStatement.new(temp))
    end

    # Returns nothing.
    def function_def
      node = Naam::AST::FunctionDef.new
      @ast.add_child node
      function_header(node)
      if_clause(node) while if_clause?
      else_clause(node)
    end

    def function_header(node)
      @series = []
      accept_series(:word, :paro, :word, :parc, :affect, :eol)
      f_header = Naam::AST::FunctionHeader.new
      f_header.add_child(Naam::AST::FunctionHeaderName.new(@series[0].value))
      f_header.add_child(Naam::AST::FunctionHeaderArg.new(@series[2].value))
      node.add_child(f_header)
    end

    # Returns nothing.
    def if_clause(node)
      @series = []
      if_node = Naam::AST::IfClause.new
      accept(:int)
      if_node.add_child(Naam::AST::ReturnValue.new(@series[0].value))
      accept(:keyword, 'if')
      test(if_node)
      accept(:eol)
      node.add_child(if_node)
    end

    # Returns nothing.
    def else_clause(node)
      @series = []
      accept(:int)
      accept(:keyword, 'else')
      accept(:eol)
      else_node = Naam::AST::ElseClause.new
      else_node.add_child(Naam::AST::ReturnValue.new(@series[0].value))
      node.add_child(else_node)
    end

    # Returns nothing.
    def test(node)
      @series = []
      accept_series(:word, :op, :int)
      test_node = Naam::AST::Test.new
      test_node.add_child(Naam::AST::TestLeft.new(@series[0].value))
      test_node.add_child(Naam::AST::TestOp.new(@series[1].value))
      test_node.add_child(Naam::AST::TestRight.new(@series[2].value))
      node.add_child(test_node)
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

  end
end
