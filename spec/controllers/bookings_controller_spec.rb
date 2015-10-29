require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  render_views
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  # describe "post #create" do
  #   it "returns http success" do
  #     post :create
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end


  # describe "POST #create" do


  #   it "renders show template when booking is successfully saved" do
  #     # Booking.any_instance.stubs(:booking_params).returns(false)
  #     # get :new
  #     assigns[:booking].should be_new_record
  #     post "create"
  #     expect(response).to redirect_to(book_path)
  #   end

  # end

end
