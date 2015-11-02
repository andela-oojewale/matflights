class PagesController < ApplicationController

  include Commons

  def index
    show_search
  end

end