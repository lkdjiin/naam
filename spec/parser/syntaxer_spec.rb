require './spec/helper'

def get_units_from(filename)
  source_lines = Reader.read fixture_file_path(filename)
  lexer = Parser::Lexer.new
  units = []

  source_lines.each do |line|
    tkr = Parser::Tokenizer.new(line)
    while tkr.has_more_token?
      units << lexer.from_token(tkr.next_token)
    end
  end
  units
end

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
