require './spec/helper'

describe Organizer do
  before do
    syntaxer = Syntaxer.new
    units = get_units_from "v0.2.0/sign2.naam"
    ast = syntaxer.run(units)
    organizer = Organizer.new(ast)
    ast = organizer.reorganize
    @program = ast.children.first
  end

  it "should not touch function def" do
    @program.children.first.is_a?(FunctionDefAST).should be_true
  end

  describe "function footer" do
    before { @def_ary = @program.children.first.children }

    specify { @def_ary[0].is_a?(FunctionHeaderAST).should be_true }
    specify { @def_ary[1].is_a?(IfClauseAST).should be_true }
    specify { @def_ary[2].is_a?(IfClauseAST).should be_true }
    specify { @def_ary[3].is_a?(ElseClauseAST).should be_true }
    specify { @def_ary[4].is_a?(FunctionFooterAST).should be_true }
  end

  describe "main" do
    before { @main = @program.children.last }

    specify { @main.is_a?(MainAST).should be_true }
    specify { @main.children.size.should eq 2 }
    specify { @main.children.first.is_a?(PrintStatementAST).should be_true }
    specify { @main.children.last.is_a?(PrintStatementAST).should be_true }
  end

end
