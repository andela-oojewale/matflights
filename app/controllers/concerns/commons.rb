module Commons

  extend ActiveSupport::Concern

  included do
    # Add any callbacks here later.
  end

  def show_search
    render "flights/show_search"
  end

end