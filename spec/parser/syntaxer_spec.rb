require './spec/helper'

describe Naam::Parser::Syntaxer do
  describe "valid file" do
    describe "checking sign.naam" do
      it "should not raise error" do
        syntaxer = Parser::Syntaxer.new
        units = get_units_from "sign.naam"
        lambda { syntaxer.run(units) }.should_not raise_error
      end
    end
  end

  describe "invalid file" do
    describe "checking invalid01.naam" do
      it "should raise error" do
        syntaxer = Parser::Syntaxer.new
        units = get_units_from "invalid01.naam"
        lambda { syntaxer.run(units) }.should raise_error
      end
    end

    describe "checking invalid02.naam" do
      it "should raise error" do
        syntaxer = Parser::Syntaxer.new
        units = get_units_from "invalid02.naam"
        lambda { syntaxer.run(units) }.should raise_error
      end
    end
  end
end
