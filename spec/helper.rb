# -*- encoding: utf-8 -*-

require 'coco'

$NAAM_PATH = File.expand_path(File.join(File.expand_path(File.dirname(__FILE__)), '..'))

require './lib/naam'
include Naam

RSpec.configure do |config|
  config.order = "random"
end

def fixture_file filename
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read file_path
end

def fixture_file_path filename
  File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
end

def get_units_from(filename)
  source_lines = Reader.read fixture_file_path(filename)
  lexer = Lexer.new
  units = []

  source_lines.each do |line|
    tkr = Tokenizer.new(line)
    while tkr.has_more_token?
      units << lexer.from_token(tkr.next_token)
    end
  end
  units
end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
