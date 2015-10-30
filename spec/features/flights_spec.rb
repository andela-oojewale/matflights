require 'rails_helper'

RSpec.feature "Flights", type: :feature do
  scenario "visit" do
    visit "/"
    expect(page).to have_title "MatFlights | Booking at ease"
    expect(page).to have_css "h1", text: "Search for flights"
  end

  scenario "search flight with valid airports" do

    visit "/"

    click_button "Search Flight"
    expect(page).to have_css("select", text: "Select Departure Airtport")

  end

end
