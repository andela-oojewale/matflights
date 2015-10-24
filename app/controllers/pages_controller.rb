class PagesController < ApplicationController
  def index
    show_search
  end

  def show_search(list = nil)
    render "flights/show_search"
  end

end
