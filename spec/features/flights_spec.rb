require 'rails_helper'
require "support/omniauth_helper"

RSpec.feature "Flights", type: :feature do
  before do
    Capybara.app_host = "localhost:3000"
    Capybara.run_server = false
    Capybara.default_driver = :selenium

    # request.env['omniauth.auth'] = set_valid_omniauth
  end

  scenario "visit" do
    visit "/"
    expect(page).to have_title "MatFlights | Booking at ease"
    expect(page).to have_css "h1", text: "Search for flights"
  end

  scenario "search form present on homepage" do
    visit "/"
    click_button "Search Flight"
    expect(page).to have_css("select", text: "Select Departure Airtport")

  end



  scenario "search for existing flight" do

    visit "/"

    select "Amsterdam Airport Schiphol", from: "flight_from_id"
    select "Dubai International Airport", from: "flight_to_id"
    select "1", from: "passengers"

    click_button "Search Flight"
    expect(page).to have_selector("a", text: "BOOK")

    # click_link "Book"

    # click_link "Login"
    # click_link "Google"
    # mock_auth_hash

    # expect(page).to have_content("Flight Information")

 end

  scenario "find no flight where departure and destination are not  chosen." do
    visit "/"

    select "Select Departure Airtport", from: "flight_from_id"
    select "Select Destination Airtport", from: "flight_to_id"
    select "1", from: "passengers"
    click_button "Search Flight"
    expect(page).to have_css("h3", text: "Select your departure and destination airports.")
  end

  scenario "find no flight where departure and destination match no flight." do
    visit "/"

    select "Amsterdam Airport Schiphol", from: "flight_from_id"
    select "Beijing Capital International Airport", from: "flight_to_id"
    select "1", from: "passengers"
    click_button "Search Flight"
    expect(page).to have_css("h3", text: "No flights found. Please make another search.")
  end

end