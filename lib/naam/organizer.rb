module Naam

  # Public: Organize the AST differently.
  # The Ast needs to be reorganized to ease the process of
  # producing PIR code.
  #
  # * Adding a «function footer» node simplify the code production
  #   of labels.
  # * Put all print statement in a «main» node simplify code
  #   production for the PIR main procedure.
  class Organizer

    # Public: Initialize an Organizer.
    #
    # ast - An AST object, typically the full AST.
    def initialize(ast)
      @ast = ast.dup
      @orphans = []
    end

    # Public: Reorganize the AST.
    #
    # Returns the reorganized AST.
    def reorganize
      build_main_function
      add_function_footer(@ast)
      @ast
    end

    private

    # Put all PrintStatementAST nodes in a MainAST node.
    #
    # Returns nothing.
    def build_main_function
      find_orphans(@ast, PrintStatementAST)
      main = MainAST.new
      @orphans.each {|orphan| main.add_child(orphan) }
      @ast.children.first.add_child(main)
    end

    # Add a «function footer» node to the end of each FunctionDefAST
    # node.
    #
    # Returns nothing.
    def add_function_footer(node)
      if node.is_a?(FunctionDefAST)
        node.add_child(FunctionFooterAST.new)
      else
        node.children.each {|child| add_function_footer(child) }
      end
    end

    # Find orphan AST nodes, that is AST nodes not in a FunctionDefAST
    # node.
    #
    # Returns nothing.
    def find_orphans(node, a_class)
      @orphans = []
      if node.has_child?(a_class)
        @orphans += node.detach_children(a_class)
      else
        node.children.each {|child| find_orphans(child, a_class) }
      end
    end

  end
end
