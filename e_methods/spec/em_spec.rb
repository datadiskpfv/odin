require 'rspec'
require 'em.rb'

describe 'Using Enumerable methods' do

  let(:users) { %w{ paul lorraine dominic jessica} }

  context "testing all methods" do
    it "testing my_count" do
      expect(users.my_count).to eql(4)
    end

    it "testing my_each" do
      expect(users.my_each { |x| x }).to eql(users)
    end

    it "testing my_select" do
      expect([1,2,3,4,5,6].my_select { |num| num.even? }).to eql([2,4,6])
    end

    it "testing all?" do
      expect(users.all? { |word| word.length >= 4 }).to eql(true)
    end

    it "testing any?" do
      expect(users.any? { |word| word.length >= 8 }).not_to eql(false)
    end
  end
end