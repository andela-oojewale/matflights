class BookingsController < ApplicationController
  def new
    if !current_user
      flash[:notice] = "You have to login before you proceed."
      redirect_to root_path :notice
    end
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
end
