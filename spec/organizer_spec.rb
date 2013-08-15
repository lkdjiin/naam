require './spec/helper'

describe Organizer do
  before do
    syntaxer = Syntaxer.new
    units = get_units_from "sign2.naam"
    ast = syntaxer.run(units)
    organizer = Organizer.new(ast)
    ast = organizer.build_main_function
    @program = ast.children.first
  end

  it "should not touch function def" do
    @program.children.first.is_a?(FunctionDefAST).should be_true
  end

  describe "main" do
    before { @main = @program.children.last }

    specify { @main.is_a?(MainAST).should be_true }
    specify { @main.children.size.should eq 2 }
    specify { @main.children.first.is_a?(PrintStatementAST).should be_true }
    specify { @main.children.last.is_a?(PrintStatementAST).should be_true }
  end

end
