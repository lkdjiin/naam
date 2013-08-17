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
    build_ast("sign2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/sign2.pir")
  end

  it "should compile succ.naam" do
    build_ast("succ.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/succ.pir")
  end

  it "should compile prev.naam" do
    build_ast("prev.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/prev.pir")
  end

  it "should compile power.naam" do
    build_ast("power.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/power.pir")
  end

  it "should compile tenth.naam" do
    build_ast("tenth.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/tenth.pir")
  end

  it "should compile mod2.naam" do
    build_ast("mod2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/mod2.pir")
  end

  it "should compile mod.naam" do
    build_ast("mod.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/mod.pir")
  end

  it "should compile power2.naam" do
    build_ast("power2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/power2.pir")
  end

  it "should compile ten_percent.naam" do
    build_ast("ten_percent.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/ten_percent.pir")
  end

  it "should compile ten_percent2.naam" do
    build_ast("ten_percent2.naam")
    emitter = Emitter.new(@ast)
    code = emitter.pir_code
    code.should eq fixture_file("pir/ten_percent2.pir")
  end

end
