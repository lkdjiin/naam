require './spec/helper'

describe Naam::Reader do

  it "should return a list of lines" do
    list = Naam::Reader.read fixture_file_path('sign.naam')
    list.should == ["sign(n)=\n", "1  if n > 0\n", "-1 if n < 0\n",
                    "0  else\n", "\n", "print sign(4)\n"]
  end
  
  it "should tell if it's a naam file" do
    result = Naam::Reader.naam_source_file? fixture_file_path('sign.naam')
    result.should be_true
  end

  it "should tell if it's not a naam file" do
    result = Naam::Reader.naam_source_file? fixture_file_path('foo.txt')
    result.should be_false
  end

  it "should tell if a file doesn't exist" do
    result = Naam::Reader.naam_source_file? fixture_file_path('unknowf.naam')
    result.should be_false
  end

end
