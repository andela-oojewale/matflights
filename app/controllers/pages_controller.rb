class PagesController < ApplicationController

  include Commons

  def index
    @home = true
    show_search
  end

end