require 'rails_helper'

RSpec.feature "SearchLoginBooks", type: :feature do
  before do
    Capybara.default_driver = :selenium
    OmniAuth.config.test_mode = true
  end

  scenario "search to login to book" do

    visit "/"

    select "Amsterdam Airport Schiphol", from: "flight_from_id"
    select "Dubai International Airport", from: "flight_to_id"
    select "1", from: "passengers"

    click_button "Search Flight"
    expect(page).to have_selector("a", text: "BOOK")

    click_link "Book"
    click_link "Login"
    click_link "Facebook"

    expect(page).to have_content("Flight Information")

    fill_in "booking_passengers_attributes_0_name", with: "Olaide"
    fill_in "booking_passengers_attributes_0_email", with: "olaide@matflights.com"

    click_on "Book Flight"

    expect(page).to have_content("Flight successfully booked.")

    click_on "Go to My Account"
    expect(page).to have_content("Past bookings")

    click_on "Example User"
    click_on "Manage booking"

    expect(page).to have_content("Enter Booking Confirmation Code")

    fill_in "ref", with: 26
    click_on "Find Reservation"

    expect(page).to have_content("Change Number of Passengers")

    fill_in "pass_num", with: 1
    click_on "Change"

    expect(page).to have_content("Change has been made, please enter passenger(s) information.")

    fill_in "booking_passengers_attributes_0_name", with: "Olaide"
    fill_in "booking_passengers_attributes_0_email", with: "olaide@matflights.com"

    click_on "Book Flight"

    expect(page).to have_content("Flight successfully booked.")

    click_on "Example User"
    click_on "Logout"

    # expect(page).to have_css "h1", text: "Search for flights"
    expect(page).to have_title "MatFlights | Booking at ease"

 end

end