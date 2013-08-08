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

describe Compiler do
  describe "valid file" do
    describe "compiling sign.naam" do
      it "should not raise error" do
        comp = Compiler.new
        units = get_units_from "sign.naam"
        lambda { comp.compile(units) }.should_not raise_error
      end
    end
  end

  describe "invalid file" do
    describe "compiling invalid01.naam" do
      it "should raise error" do
        comp = Compiler.new
        units = get_units_from "invalid01.naam"
        lambda { comp.compile(units) }.should raise_error
      end
    end

    describe "compiling invalid02.naam" do
      it "should raise error" do
        comp = Compiler.new
        units = get_units_from "invalid02.naam"
        lambda { comp.compile(units) }.should raise_error
      end
    end
  end
end
