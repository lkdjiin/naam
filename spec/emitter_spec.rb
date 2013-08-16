require './spec/helper'

describe Emitter do
  before do
    syntaxer = Syntaxer.new
    units = get_units_from "sign2.naam"
    ast = syntaxer.run(units)
    organizer = Organizer.new(ast)
    @ast = organizer.reorganize
  end

  it "should compile to PIR code" do
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("sign2.pir")
  end
end
