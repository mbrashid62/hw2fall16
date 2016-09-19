require 'part5.rb'

describe "CartesianProduct" do
  it "should exist" do
    expect(lambda { CartesianProduct.new(1..2,3..4) }).not_to raise_error
  end
end

