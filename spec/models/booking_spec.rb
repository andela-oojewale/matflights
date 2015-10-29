require 'rails_helper'

RSpec.describe Booking, type: :model do
 subject(:booking) { Booking.new(flight_id: flight_id, no_of_passengers: no_of_passengers, confirmation_code: confirmation_code) }
 let(:flight_id){1}
 let(:no_of_passengers){1}
 let(:confirmation_code){1}

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
    let(:user_id){"2wjdjf24fkfkfo"}
    let(:provider){"google"}
    let(:email){""}
    it "should be invalid" do
      expect do
        Booking.new.get_all_bookings(user_code: user_id,  provider: provider, email: email).to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
