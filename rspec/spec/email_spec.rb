require 'rspec'
require 'email_verification_job.rb'

describe EmailVerificationJob do
  describe "#perform" do

    it "finds the email by id" do
      expect(Email).to receive(:find).with(12)

      EmailVerificationJob.new.perform(12)
    end
  end
end