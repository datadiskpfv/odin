require 'rspec'
require 'run.rb'

describe Run do

  subject { Run.new }

  describe ".count" do

    context "with 2 logged runs this week and 1 in next" do

      before do
        2.times do
          Run.log(32, 5.2, "2017-07-04 08:50")
        end

        Run.log(32, 5.2, "2017-07-04 08:50")
      end

      context "without arguments" do
        it "returns 3" do
          expect(Run.count).to eql(3)
        end
      end

      context "with :week set to this week" do
        it "returns 2" do
          expect(Run.count(:week => "2015-01-12")).to eql(2)
        end
      end
    end
  end
end