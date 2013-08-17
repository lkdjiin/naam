require './spec/helper'

describe Syntaxer do

  describe "valid file" do# {{{
    describe "checking sign.naam" do
      it "should not raise error" do
        syntaxer = Syntaxer.new
        units = get_units_from "v0.2.0/sign.naam"
        lambda { syntaxer.run(units) }.should_not raise_error
      end
    end

    describe "checking succ.naam" do
      it "should not raise error" do
        syntaxer = Syntaxer.new
        units = get_units_from "v0.2.0/succ.naam"
        lambda { syntaxer.run(units) }.should_not raise_error
      end
    end

    describe "checking mod2.naam" do
      it "should not raise error" do
        syntaxer = Syntaxer.new
        units = get_units_from "v0.2.0/mod2.naam"
        lambda { syntaxer.run(units) }.should_not raise_error
      end
    end

  end# }}}

  describe "invalid file" do# {{{
    describe "checking invalid01.naam" do
      it "should raise error" do
        syntaxer = Syntaxer.new
        units = get_units_from "v0.2.0/invalid01.naam"
        lambda { syntaxer.run(units) }.should raise_error
      end
    end

    describe "checking invalid02.naam" do
      it "should raise error" do
        syntaxer = Syntaxer.new
        units = get_units_from "v0.2.0/invalid02.naam"
        lambda { syntaxer.run(units) }.should raise_error
      end
    end
  end# }}}
end
