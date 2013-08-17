module Naam

  # Public: Compile the AST into PIR code.
  class Emitter

    # Public: Initialize an Emitter.
    #
    # ast - An AST object, typically the full AST.
    def initialize(ast)
      @ast = ast.dup
      @code = ""
      @label = "LABEL0000"
      @labels = []
    end

    # Public: Get PIR code.
    #
    # Returns PIR code as a String.
    def pir_code
      compile(@ast)
      @code
    end

    private

    # Returns nothing.
    def compile(node)
      case node
      when MainAST then compile_main(node)
      when FunctionHeaderAST then compile_header(node)
      when IfClauseAST then compile_if_clause(node)
      when ElseClauseAST then compile_else_clause(node)
      when FunctionFooterAST then compile_footer
      end
      node.children.each {|child| compile(child) }
    end

    # Returns nothing.
    def compile_main(node)
      @code += ".sub main :main\n"
      @code += "    .local int f\n"
      node.children.each do |child|
        @code += "    f = #{child.value}\n"
        @code += "    say f\n"
      end
      @code += ".end\n"
    end

    # Returns nothing.
    def compile_header(node)
      name = node.children.first.value
      arg = node.children.last.value
      @code += ".sub #{name}\n"
      @code += "    .param int #{arg}\n"
      @code += "    .local int result\n"
    end

    # Returns nothing.
    def compile_if_clause(node)
      ret_value = node.children.first.value
      label = next_label(ret_value)
      test_node = node.children.last
      left = test_node.children.first.value
      op = test_node.children[1].value
      right = test_node.children.last.value
      @code += "    if #{left} #{op} #{right} goto #{label[:name]}\n"
    end

    # Returns nothing.
    def compile_else_clause(node)
      @code += "    result = #{node.children.first.children.first.value}\n"
      @code += "    goto RETURN\n"
    end

    # Returns nothing.
    def compile_footer
      @labels.each do |lbl|
        @code += lbl[:name] + ":\n"
        @code += "    result = #{lbl[:value]}\n"
        @code += "    goto RETURN\n"
      end
      @code += "RETURN:\n"
      @code += "    .return(result)\n"
      @code += ".end\n"
    end

    # Get the next label.
    #
    # value - The String value attached to the label.
    #
    # Examples
    #
    #   next_label
    #   # => {name: "LABEL0001", value: "123"}.
    #
    # Returns a Hash.
    def next_label(value)
      label = {name: @label.next!.dup, value: value}
      @labels << label
      label
    end

  end
end
