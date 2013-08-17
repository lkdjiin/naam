require './spec/helper'

describe Compiler do
  before { @object = Compiler.new fixture_file_path("v0.2.0/sign.naam") }
  after { File.delete fixture_file_path("v0.2.0/out.pir") }

  it "should compile to out.pir" do
    @object.compile
    expected = fixture_file("pir/v0.2.0/sign.pir")
    got = fixture_file("v0.2.0/out.pir")
    got.should eq expected
  end
end
