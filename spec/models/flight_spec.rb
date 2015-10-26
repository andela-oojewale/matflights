require 'rails_helper'

RSpec.describe Flight, type: :model do
  # subject(:flight) { Flight.new(tos: to, froms: from, dept_time: dept_time) }
  let(:to) {4}
  let(:from) {11}
  let(:dept_time) {"10/28/2015"}

  context "#valid_airports" do
    it { is_expected.to be_a Flight }
  end

  context "#valid_airports" do
    let(:to) {"a"}
    it { is_expected.to be_invalid }
  end

end