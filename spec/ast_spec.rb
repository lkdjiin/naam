require './spec/helper'

describe "AST" do
  before do
    syntaxer = Naam::Parser::Syntaxer.new
    units = get_units_from "sign.naam"
    @ast = syntaxer.run(units)
  end

  specify { @ast.is_a?(Naam::AST::Node).should be_true }
  specify { @ast.name.should eq "program" }
  specify { @ast.children.first.name.should eq "function definition" }
  specify { @ast.children.last.name.should eq "print statement" }

  it "should output ast without raising error" do
    lambda {@ast.display}.should_not raise_error
  end
end
