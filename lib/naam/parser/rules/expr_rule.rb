module Naam
  class ExprRule < BaseRule
    def apply!
      case @units.first.type
      when :int then accept(:int)
      when :word then accept(:word)
      end
      if @units.first.type == :op
        accept(:op)
        apply!
      else
        val = @series.map {|s| s.value }.join(' ')
        @ast_node.add_child(ReturnValueAST.new(val))
      end
    end
  end
end
