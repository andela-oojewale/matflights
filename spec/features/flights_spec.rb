require "rails_helper"

RSpec.feature "Flights", type: :feature do
  before do
    Capybara.default_driver = :selenium
    OmniAuth.config.test_mode = true
  end

  scenario "visit" do
    visit "/"
    expect(page).to have_title "MatFlights | Booking at ease"
    expect(page).to have_css "h1", text: "Search for flights"
  end

  scenario "search form present on homepage" do
    visit "/"
    click_button "Search Flight"
    expect(page).to have_css("select", text: "Select Departure Airport")

  end

  scenario "find no flight where departure and destination are not chosen." do
    visit "/"

    select "Select Departure Airport", from: "flight_from_id"
    select "Select Destination Airport", from: "flight_to_id"
    select "1", from: "passengers"
    click_button "Search Flight"
    expect(page).to have_content("Select your departure and destination airports.")
  end

  scenario "find all flights." do
    visit "/"

    click_link "All Flights"
    expect(page).to have_css("th", text: "Price/Person")
  end

end