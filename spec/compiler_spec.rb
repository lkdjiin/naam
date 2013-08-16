require './spec/helper'

describe Compiler do
  before { @object = Compiler.new fixture_file_path("sign.naam") }

  it "should compile to out.pir" do
    @object.compile
    expected = fixture_file("pir/sign.pir")
    got = fixture_file("out.pir")
    got.should eq expected
  end
end
