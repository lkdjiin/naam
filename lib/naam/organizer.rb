module Naam

  # Public: Organize the AST differently.
  class Organizer

    # Public: Initialize an Organizer.
    #
    # ast - An AST object, typically the full AST.
    def initialize(ast)
      @ast = ast.dup
      @orphans = []
    end

    # Public: Put all PrintStatementAST nodes in a MainAST node.
    #
    # Returns the new AST.
    def build_main_function
      find_orphans(@ast, PrintStatementAST)
      main = MainAST.new
      @orphans.each {|o| main.add_child(o) }
      @ast.children.first.add_child(main)
      @ast
    end

    private

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
