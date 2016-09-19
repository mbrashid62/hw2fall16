class CartesianProduct
  include Enumerable


  def initialize (sequence_a, sequence_b)
    @sequence_a = sequence_a
    @sequence_b = sequence_b
  end

end

c = CartesianProduct.new([:a, :b], [4, 5])

c.my_method
c.each {|element| puts element.inspect}
