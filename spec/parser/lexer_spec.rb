require './spec/helper'

describe Naam::Parser::Lexer do
  before do
    @lexer = Parser::Lexer.new
  end

  it "should lexify positive integer" do
    lexeme = @lexer.from_token("123")
    lexeme.type.should == :int
    lexeme.value.should == "123"
  end

  it "should lexify negative integer" do
    lexeme = @lexer.from_token("-123")
    lexeme.type.should == :int
    lexeme.value.should == "-123"
  end

  it "should lexify a word" do
    lexeme = @lexer.from_token("foo")
    lexeme.type.should == :word
    lexeme.value.should == "foo"
  end

  it "should lexify paro" do
    lexeme = @lexer.from_token("(")
    lexeme.type.should == :paro
    lexeme.value.should == "("
  end

  it "should lexify parc" do
    lexeme = @lexer.from_token(")")
    lexeme.type.should == :parc
    lexeme.value.should == ")"
  end

  it "should lexify end of line" do
    lexeme = @lexer.from_token("\n")
    lexeme.type.should == :eol
    lexeme.value.should == "\n"
  end

  describe "keywords" do
    it "should lexify 'if'" do
      lexeme = @lexer.from_token("if")
      lexeme.type.should == :keyword
      lexeme.value.should == "if"
    end

    it "should lexify 'else'" do
      lexeme = @lexer.from_token("else")
      lexeme.type.should == :keyword
      lexeme.value.should == "else"
    end
  end

  it "should lexify affect" do
    lexeme = @lexer.from_token("=")
    lexeme.type.should == :affect
    lexeme.value.should == "="
  end

  describe "operators" do
    it "should lexify <" do
      lexeme = @lexer.from_token("<")
      lexeme.type.should == :op
      lexeme.value.should == "<"
    end

    it "should lexify >" do
      lexeme = @lexer.from_token(">")
      lexeme.type.should == :op
      lexeme.value.should == ">"
    end
  end

end
