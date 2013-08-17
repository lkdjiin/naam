module Naam
  # Public: Program rule. See Naam's grammar.
  class ProgramRule < BaseRule
    def apply!
      prog_node = ProgramAST.new
      while more_units?
        case @units.first.type
        # When catched here, an end of line is not significant.
        when :eol then accept(:eol)
        else
          InstructionRule.new(@units, prog_node).apply!
        end
      end
      @ast_node.add_child(prog_node)
    end

    private

    def more_units?
      @units.size > 0
    end
  end
end
