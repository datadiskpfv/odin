require 'rspec'
require 'ccipher'

describe 'Using CCipher' do

  context "given a string 'What a stringZ!'" do
    context "and using factor 5" do
      it "should return 'Bmfy f xywnslE!'" do
        expect(CCipher.caesar_cipher("What a stringZ!", 5)).to eql("Bmfy f xywnslE!")
      end
    end

    context "and using factor 8" do
      it "should return 'Epib i abzqvoH!'" do
        expect(CCipher.caesar_cipher("What a stringZ!", 8)).to eql("Epib i abzqvoH!")
      end
    end
  end
end