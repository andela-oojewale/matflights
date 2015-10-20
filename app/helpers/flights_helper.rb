module FlightsHelper

  def get_user_image(user_image)
      image_tag(user_image, class: "circle responsive-img") if user_image
  end

  def current_user
    true if session[:user_id]
  end

  def get_all_airports(field_name, msg, class_desc)
    collection_select :flight, field_name, Airport.all, :code, :name, {include_blank: msg}, {class: class_desc}
  end

  def gen_select_opt(start, limit)
    opt_arr = temp_arr = []
    while start <= limit
      2.times { temp_arr = Array.new(3, start) }
      opt_arr << temp_arr
      start += 1
      end
    opt_arr
  end

  def get_dropdown(field_name, start, limit = nil, msg, class_desc)
      select_tag(field_name, options_for_select( gen_select_opt(start, limit) ), {class: class_desc, prompt: msg}
      )
  end

  # def list_all_flights(flights_list)

  #     flights_list.each do | a_flight |
          # content_tag :tr
  #       attributes = [ a_flight.id, a_flight.airline, a_flight.from_id, a_flight.to_id, a_flight.dept_time, a_flight.cost, "Book"]
  #       counter = 0
  #       while counter < 7
  #        content_tag :td, attributes[counter]
  #         counter += 1
  #           # require "pry"; binding.pry
  #       end

  #   end
  # end

end
