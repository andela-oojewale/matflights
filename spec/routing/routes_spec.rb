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

  it "routes FB OAuth path to sessions controller and create action" do
    expect(:get => "/auth/facebook").to route_to(
      :controller => "sessions",
      :action => "create"
    )
  end

  it "routes root path to pages controller and index action" do
    expect(get("/loggedin")).to route_to("flights#loggedin")
  end

  it "routes root path to pages controller and index action" do
    expect(get("/index")).to route_to("flights#index")
  end

  it "routes root path to pages controller and index action" do
    expect(post("/search")).to route_to("flights#show")
  end

  it "routes root path to pages controller and index action" do
    expect(get("/book")).to route_to("bookings#new")
  end

  it "routes root path to pages controller and index action" do
    expect(post("/to_booking")).to route_to("bookings#create")
  end

end