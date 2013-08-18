require './spec/helper'

describe "AST" do
  before do
    syntaxer = Syntaxer.new
    units = get_units_from "v0.2.0/sign.naam"
    @ast = syntaxer.run(units)
  end

  specify { @ast.is_a?(AST).should be_true }
  specify { @ast.name.should eq "ast" }
  specify { @ast.children.first.name.should eq "program" }

  it "should display itself" do
    output = capture_stdout { @ast.display }
    output.start_with?("AST\n  ProgramAST").should be_true
  end
end
