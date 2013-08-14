require './spec/helper'

describe LexicalUnit do

  it "should not allow direct instanciation" do
    lambda do
      LexicalUnit.new(:int, "123")
    end.should raise_error(NoMethodError)
  end

  it "should create a type int" do
    unit = LexicalUnit.int("456")
    unit.type.should == :int
    unit.value.should == "456"
  end

  it "should create a signed int" do
    unit = LexicalUnit.int("-456")
    unit.type.should == :int
    unit.value.should == "-456"
  end

  it "should create a type word" do
    unit = LexicalUnit.word("foo")
    unit.type.should == :word
    unit.value.should == "foo"
  end

  it "should create a type paro" do
    unit = LexicalUnit.paro()
    unit.type.should == :paro
    unit.value.should == "("
  end

  it "should create a type parc" do
    unit = LexicalUnit.parc()
    unit.type.should == :parc
    unit.value.should == ")"
  end

  it "should create a type eol" do
    unit = LexicalUnit.eol()
    unit.type.should == :eol
    unit.value.should == "\n"
  end

  it "should create a type keyword" do
    unit = LexicalUnit.keyword("if")
    unit.type.should == :keyword
    unit.value.should == "if"
  end

  it "should create a type affect" do
    unit = LexicalUnit.affect()
    unit.type.should == :affect
    unit.value.should == "="
  end

  it "should create a type op" do
    unit = LexicalUnit.op("<")
    unit.type.should == :op
    unit.value.should == "<"
  end

end
