module Naam::AST
  class Name < Node
    def initialize value
      super("name")
      @value = value
    end
  end
end

