module Naam

  # Public: Base class for AST construction. Also the root node of an
  # AST.
  class AST

    # Public: Initialize a new AST node.
    #
    # name - String name of this node.
    def initialize name
      @name = name
      @children = []
      @value = nil
    end

    # Public: Returns Array children's nodes of this node.
    attr_reader :children

    # Public: Returns the String name of this node.
    attr_reader :name

    attr_reader :value

    # Public: Add a child node to the end of the children's list.
    #
    # child - An AST node to add to the list of children.
    #
    # Returns self.
    def add_child child
      @children << child
      self
    end

    # Public: Returns True if this node is a leaf.
    def leaf?; @children.empty?; end

    def display(indent = 0)
      print " " * indent + self.class.name.split('::').last
      print " ::= #{@value}" if leaf?
      puts
      @children.each {|child| child.display(indent + 2) }
    end

    # Public: Check if this node has a child of class a_class.
    #
    # a_class - The Class to check.
    #
    # Returns Boolean.
    def has_child?(a_class)
      ret = false
      @children.each do |child|
        ret = true if child.is_a?(a_class)
      end
      ret
    end

    # Public: Detach all children's nodes of class a_class from this
    # node.
    #
    # a_class - The Class to check.
    #
    # Returns an Array with detached AST nodes.
    def detach_children(a_class)
      ret = []
      @children.each do |child|
        if child.is_a?(a_class)
          ret << @children.delete(child)
        end
      end
      ret
    end

  end
end

