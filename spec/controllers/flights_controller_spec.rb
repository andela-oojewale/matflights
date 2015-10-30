require 'rails_helper'

RSpec.describe FlightsController, type: :controller do

  context "GET index" do
    before do
      get :index
    end
    it "responds with index template when it is invoked" do
        expect(response).to render_template(:index)
    end
  end

  context "GET look_up_search" do
    @flights_list = Flight.new.search_flight(1, 2, "")
    it "responds with show_search template if there's a flight" do
        expect(flash).to be_a ActionDispatch::Flash::FlashHash
    end
  end
end
