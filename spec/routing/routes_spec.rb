require 'rails_helper'

RSpec.describe "Routes", type: :routing do
   it "routes root path to pages controller and index action" do
    expect(get("/")).to route_to("pages#index")
  end

  it "routes logout path to sessions controller and destroy action" do
    expect(:get => "/logout").to route_to(
      :controller => "sessions",
      :action => "destroy"
    )
  end

  it "routes google OAuth path to sessions controller and create action" do
    expect(:get => "/auth/:provider/callback").to route_to(
      :controller => "sessions",
      :action => "create",
      :provider => ":provider"
    )
  end

  it "routes flights/all path to flights controller and index action" do
    expect(get("flights/all")).to route_to("flights#index")
  end

  it "routes search path to flights controller and search action" do
    expect(get("flights/search")).to route_to("flights#search")
  end

  it "routes make_booking path to bookings controller and new action" do
    expect(get("booking/make_booking")).to route_to("bookings#new")
  end

  it "routes root path to bookings controller and create action" do
    expect(post("to_booking")).to route_to("bookings#create")
  end

  it "routes root path to bookings controller and index action" do
    expect(get("dashboard")).to route_to("bookings#index")
  end

end