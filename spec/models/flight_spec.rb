require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject(:flight) { Flight.new(to_id: to, from_id: from) }
  let(:to) {4}
  let(:from) {11}

  context "when appropriate values of to and from" do
    it { is_expected.to be_a Flight }
  end

  context "when inappropriate values of to/from" do
    let(:to) {""}
    it { is_expected.to be_invalid }
  end

  describe "#get_flight" do
    let(:dept_time){""}
    it "should be invalid" do
      expect(Flight.new.get_flight(to, from , dept_time)).to be_valid
    end
  end

  describe "#get_flight" do
    let(:dept_time){"2015-10-28"}
    it "should be invalid" do
      expect(Flight.new.get_flight(to, from , dept_time)).to be_valid
    end
  end

end