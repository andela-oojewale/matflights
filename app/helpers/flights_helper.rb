module FlightsHelper

  def get_user_image(user_image)
      image_tag(user_image, class: "circle responsive-img") if user_image
  end

  def get_all_airports(field_name, msg, class_desc)
    collection_select :flight, field_name, Airport.order("name ASC"), :id, :name, {include_blank: msg}, {class: class_desc}
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

  def get_dropdown(field_name, start, limit = nil, msg = nil, class_desc)
      select_tag(field_name, options_for_select( gen_select_opt(start, limit) ), {class: class_desc, prompt: msg}
      )
  end

  def get_booking_params(flight, attributes)
    { id: flight.id, code: flight.flight_code, dept: attributes[1], dest: attributes[2], flight_datetime: attributes[3], cost: flight.cost, pass: "#{params[:passengers]}", airline: attributes[0] }
  end

end