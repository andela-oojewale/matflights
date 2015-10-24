class BookingsController < ApplicationController
  before_filter :verify_login
  def new

  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def verify_login
    if !current_user
      flash[:notice] = "You have to login before you proceed."
      redirect_to root_path :notice
    end
  end
end
