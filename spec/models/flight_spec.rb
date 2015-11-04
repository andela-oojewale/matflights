require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject(:flight) { Flight.new(to_id: to, from_id: from, dept_date: dept_date ) }
  let(:to) {4}
  let(:from) {11}
  let(:dept_date) {"2015-11-11"}

  context "when appropriate values of to and from" do
    it { is_expected.to be_a Flight }
  end

  context "when inappropriate values of to/from" do
    let(:to) {""}
    it { is_expected.to be_invalid }
  end

  describe "#get_flight" do
    it "gets flights when date is not set" do
      flight.save
      expect(flight.get_flight(to, from)).to be_an Object
      end
  end

  describe "#get_flight" do
    it "gets flights when date is set" do
      flight.save
      expect(flight.get_flight(to, from, dept_date)).to be_an Object
      end
  end

  describe "#get_all_flights" do
    it "gets all flights" do
      flight.save
      expect(flight.get_all_flights).to be_an Object
      end
  end

  describe "#valid_airports" do
    let(:to) {""}
    let(:from) {""}
    it "checks that airports are invalid when  none is chosen" do
      expect(flight.valid_airports(from, to)).to be_a String
      end
  end

  describe "#valid_airports" do
    it "checks that airports are invalid when  they are the same" do
      expect(flight.valid_airports("Istanbul Atatürk Airport", "Istanbul Atatürk Airport")).to be_a String
      end
  end

  describe "#search_flight" do
    it "searches flight for the info given" do
      flight.save
      expect(flight.search_flight(to, from , dept_date)).to be_an Object
      end
  end

  describe "#search_flight" do
    let(:from) {""}
    let(:to) {""}
    it "searches flight for the info given" do
      flight.save
      expect(flight.search_flight(to, from , dept_date)).to be_an String
      end
  end

end