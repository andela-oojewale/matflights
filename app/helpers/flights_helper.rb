module FlightsHelper

  def get_user_image(user_image)
      image_tag(user_image, class: "circle responsive-img") if user_image
  end

  def current_user
    true if session[:user_id]
  end

end
