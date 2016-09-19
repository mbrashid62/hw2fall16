require 'part1.rb'

describe 'Ruby Part 1' do
  describe "#palindrome?" do
    it "should be defined" do
        expect(lambda {palindrome?("Testing")}).not_to raise_error
    end

    it "returns true if it recieves a single word palindrome" do
      expect(palindrome?("racecar")).to be true
    end

    it "ignores white spaces" do
      expect(palindrome?(" racecar ")).to be true
      expect(palindrome?(" race  car ")).to be true
    end

    it "ignores other non-word characters" do
      expect(palindrome?("rac--ecar, !")).to be true
      expect(palindrome?("^$%#racecar$")).to be true
    end

    it "works on sentances too" do
      expect(palindrome?("Madam, I'm Adam")).to be true
      expect(palindrome?("Dad Mom Dad")).to be true
    end

    it "returns false when passed a non-palindrome" do
      expect(palindrome?("abra kadabra")).to be false
      expect(palindrome?("123Racecar")).to be false
      expect(palindrome?("Ay dios Mio")).to be false
    end
  end

  describe "#count_words" do
    it "should be defined" do
      expect(lambda{count_words("Testing")}).not_to raise_error
    end
    it "should return a Hash" do
      expect(count_words("Testing")).to be_a_kind_of(Hash)
    end

    it "should return a hash with the right amount of word occurences" do
      hash = {'a' => 3, 'silly' => 1, 'funny' => 1, 'duck' => 1}
      expect(count_words("a silly a funny a duck")).to eq(hash)
    end
    it "should ignore non-word chars" do
      hash = {'a' => 4, 'man' => 1, 'canal' => 1, 'plan' => 1}
      expect(count_words("a man, a plan, a canal -a!")).to eq(hash)
    end

    it "should ignore capitilization" do
      hash = {'a' => 4, 'man' => 1, 'canal' => 1, 'plan' => 1}
      expect(count_words("a man, A plan, a canal --A")).to eq(hash)
    end
  end

end


