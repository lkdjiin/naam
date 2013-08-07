require './spec/helper'

describe Naam::Parser::Tokenizer do

  describe "has_more_token?" do# {{{
    it "should return true when a token is available" do
      tkr = Parser::Tokenizer.new("sign(n)=\n")
      tkr.has_more_token?.should be_true
      tkr.next_token
      tkr.has_more_token?.should be_true
    end

    it "should return false when no more tokens are available" do
      tkr = Parser::Tokenizer.new("0 else\n")
      3.times {tkr.next_token}
      tkr.has_more_token?.should_not be_true
    end
  end# }}}

  describe "next_token" do# {{{
    it "should return integer" do
      tkr = Parser::Tokenizer.new("2 + 3")
      tkr.next_token.should == "2"
    end

    it "should return word" do
      tkr = Parser::Tokenizer.new("sign(n)=\n")
      tkr.next_token.should == "sign"
    end

    it "should return opened parenthesis" do
      tkr = Parser::Tokenizer.new('(n)')
      tkr.next_token.should == '('
    end

    it "should return closed parenthesis" do
      tkr = Parser::Tokenizer.new(")\n")
      tkr.next_token.should == ')'
    end

    it "should return eq" do
      tkr = Parser::Tokenizer.new("=\n")
      tkr.next_token.should == '='
    end

    it "should return end of line" do
      tkr = Parser::Tokenizer.new("\n")
      tkr.next_token.should == "\n"
    end

  end# }}}

  describe "example 1: sign(n)=" do# {{{
    it "should tokenize" do
      tkr = Parser::Tokenizer.new("sign(n)=\n")
      tkr.next_token.should == "sign"
      tkr.next_token.should == "("
      tkr.next_token.should == "n"
      tkr.next_token.should == ")"
      tkr.next_token.should == "="
      tkr.next_token.should == "\n"
    end
  end# }}}

  describe "example 2: 1 if n > 0" do# {{{
    it "should tokenize" do
      tkr = Parser::Tokenizer.new("1 if n > 0\n")
      tkr.next_token.should == "1"
      tkr.next_token.should == "if"
      tkr.next_token.should == "n"
      tkr.next_token.should == ">"
      tkr.next_token.should == "0"
      tkr.next_token.should == "\n"
    end
  end# }}}

  describe "example 3: -1 if n < 0" do# {{{
    it "should tokenize" do
      tkr = Parser::Tokenizer.new("-1 if n < 0\n")
      tkr.next_token.should == "-1"
      tkr.next_token.should == "if"
      tkr.next_token.should == "n"
      tkr.next_token.should == "<"
      tkr.next_token.should == "0"
      tkr.next_token.should == "\n"
    end
  end# }}}

  describe "example 4: 0 else" do# {{{
    it "should tokenize" do
      tkr = Parser::Tokenizer.new("0 else\n")
      tkr.next_token.should == "0"
      tkr.next_token.should == "else"
      tkr.next_token.should == "\n"
    end
  end# }}}

end

