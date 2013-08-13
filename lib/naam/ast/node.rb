module Naam::AST
  class Node

    def initialize name
      @name = name
      @children = []
    end

    attr_reader :children

    def add_child child; @children << child; end

    def leaf?; @children.empty?; end

    def display(indent = 0)
      print " " * indent + @name
      print " ::= #{@value}" if leaf?
      puts
      @children.each {|child| child.display(indent + 2) }
    end

  end
end

