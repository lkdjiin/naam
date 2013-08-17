require './spec/helper'

def build_ast(filename)
  syntaxer = Syntaxer.new
  units = get_units_from filename
  ast = syntaxer.run(units)
  organizer = Organizer.new(ast)
  @ast = organizer.reorganize
end

describe Emitter do

  it "should compile sign2.naam" do
    build_ast("v0.2.0/sign2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/sign2.pir")
  end

  it "should compile succ.naam" do
    build_ast("v0.2.0/succ.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/succ.pir")
  end

  it "should compile prev.naam" do
    build_ast("v0.2.0/prev.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/prev.pir")
  end

  it "should compile power.naam" do
    build_ast("v0.2.0/power.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/power.pir")
  end

  it "should compile tenth.naam" do
    build_ast("v0.2.0/tenth.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/tenth.pir")
  end

  it "should compile mod2.naam" do
    build_ast("v0.2.0/mod2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/mod2.pir")
  end

  it "should compile mod.naam" do
    build_ast("v0.2.0/mod.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/mod.pir")
  end

  it "should compile power2.naam" do
    build_ast("v0.2.0/power2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/power2.pir")
  end

  it "should compile ten_percent.naam" do
    build_ast("v0.2.0/ten_percent.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/ten_percent.pir")
  end

  it "should compile ten_percent2.naam" do
    build_ast("v0.2.0/ten_percent2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/v0.2.0/ten_percent2.pir")
  end

end
