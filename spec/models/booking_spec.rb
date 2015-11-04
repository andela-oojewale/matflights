require 'rails_helper'

RSpec.describe Booking, type: :model do
 subject(:booking) { Booking.new(flight_id: flight_id, no_of_passengers: no_of_passengers, confirmation_code: confirmation_code)}
 let(:flight_id){1}
 let(:no_of_passengers){1}
 let(:confirmation_code){1}

  before(:each) do
    booking.save
  end
  context "booking with all params" do
    it {is_expected.to be_valid}
  end

  context "booking with invalid attributes" do
    let(:flight_id){""}
    it {is_expected.to be_invalid}

    let(:no_of_passengers){""}
    it {is_expected.to be_invalid}

    let(:confirmation_code){""}
    it {is_expected.to be_invalid}

    let(:flight_id){""}
    let(:no_of_passengers){""}
    let(:confirmation_code){""}
    it {is_expected.to be_invalid}
  end


  describe "#get_all_bookings" do
    it "fetches all bookings" do
      expect(booking.get_all_bookings("b.id",1)).to be_an Array
    end
  end

  describe "#delete_record" do
    it "deletes a booking" do
      expect { booking.delete_record(booking.id) }.to change(Booking, :count)
    end
  end

  describe "#get_confirmation" do
    it "fetches confirmation code" do
      expect(booking.get_confirmation(confirmation_code)).to be_valid
    end
  end

  describe "#reset_passengers" do
    it "resets number of passengers for the booking with the given id" do
      expect(booking.reset_passengers(2, booking.id)).to be true
    end
  end

end