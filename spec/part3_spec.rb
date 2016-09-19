require 'part3.rb'

describe "dessert" do
  it "should define a constructor" do
    expect(lambda {Dessert.new('a', 1)}).not_to raise_error
  end
 [:healthy?, :delicious?].each do |method|
    it "should define #{method}" do
      expect(Dessert.new('a',1)).to respond_to(method)
    end
 end

  describe "constructor" do
    it "should reject an empty desert name" do
      expect(lambda {Dessert.new('', 100)}).to raise_error(ArgumentError)
    end

    it "should reject zero calories" do
      expect(lambda {Dessert.new('pumpkin pie', 0)}).to raise_error(ArgumentError)
    end

    it "should reject negative calories" do
      expect( lambda {Dessert.new('pumpkin pie', -10)}).to raise_error(ArgumentError)
    end
  end

  describe "getters and setters" do
    before(:each) { @dessert = Dessert.new('pumpkin pie', 500) }
    it "should set the name to pumpkin pie" do
      expect(@dessert.name).to eq ('pumpkin pie')
    end
    it "should set the calories to 500" do
      expect(@dessert.calories).to eq (500)
    end
    it "should change the name to apple pie" do
      @dessert.name = 'apple pie'
      expect(@dessert.name).to eq ('apple pie')
    end
    it "should change the calories to 1000" do
      @dessert.calories = 1000
      expect(@dessert.calories).to eq (1000)
    end
  end

  describe "#healthy?" do
    it "should return true if the dessert is less than 200 calories" do
      expect(Dessert.new('ice cream', 100).healthy?).to eq (true)
      expect(Dessert.new('pumpkin pie', 500).healthy?).to eq (false)
      expect(Dessert.new('fro yo', 200).healthy?).to eq (false)
    end
  end

  describe "#delicious?" do
    it "should return true regardless of calories" do
      expect(Dessert.new('ice cream', 100).delicious?).to eq (true)
      expect(Dessert.new('pumpkin pie', 500).delicious?).to eq (true)
      expect(Dessert.new('fro yo', 200).delicious?).to eq (true)
    end
  end
end

describe "jellybean" do
  it "should define a constructor" do
    expect(lambda { JellyBean.new('a', 1, 2) }).not_to raise_error
  end
    [:healthy?, :delicious?].each do |method|
    it "should define #{method}" do
      expect(JellyBean.new('a',1, 2)).to respond_to(method) 
    end
  end

  describe "getters and setters" do
    before(:each) { @jellybean = JellyBean.new('jelly bean', 500, 'cherry_red') }
    it "should set the name to jelly bean" do
      expect(@jellybean.name).to eq ('jelly bean')
    end
    it "should change the name to Jelly Bean" do
      @jellybean.name = 'Jelly Bean'
      expect(@jellybean.name).to eq ('Jelly Bean')
    end
    it "should set the flavor to cherry_red" do
      expect(@jellybean.flavor).to eq ('cherry_red')
    end
    it "should change the flavor to black licorice" do
      @jellybean.flavor = 'black licorice'
      expect(@jellybean.flavor).to eq ('black licorice')
    end
  end

  describe "#delicious?" do
    it "should return true for all flavors except for black licorice" do
      expect(JellyBean.new('JellyBean', 50, 'black licorice').delicious?).to eq false
      expect(JellyBean.new('JellyBean', 50, 'cherry').delicious?).to eq true
      expect(JellyBean.new('JellyBean', 50, 'grape').delicious?).to eq true
    end
  end
end
