require './spec/helper'

describe BaseRule do
  it "should be kind of abstract" do
    object = BaseRule.new(nil, nil)
    lambda { object.apply! }.should raise_error(NotImplementedError)
  end
end
