module Naam
  # Public: Instruction rule. See Naam's grammar.
  class InstructionRule < BaseRule

    # Raises an error if the next units doesn't form an Naam's
    #   instruction.
    def apply!
      case @units.first.type
      when :keyword
        PrintStatementRule.new(@units, @ast_node).apply!
      when :word
        FunctionDefRule.new(@units, @ast_node).apply!
      else
        raise RuleError, "#{@units.first.inspect}"
      end
    end
  end
end
