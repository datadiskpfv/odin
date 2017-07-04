require 'rspec'
require 'run.rb'

## notice the Run which is the Run class
describe Run do

  subject { Run.new(32, 5.2, "2017-07-04 08:50") }

  it { is_expected.to respond_to(:duration) }
  it { is_expected.to respond_to(:distance) }
  it { is_expected.to respond_to(:timestamp) }

end