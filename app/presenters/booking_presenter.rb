require "delegate"

class BookingPresenter < SimpleDelegator
  def paypal_url(return_path, cost, pass)
    values = {
        business: "ojewaleolaide-facilitator@gmail.com",
        cmd: "_cart",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}"
    }
    ref = 0
    pass.each do | key, details |
      details.each do | detail_key, details_val |
      values.merge!({
        Name: details_val["name"],
        Cost: cost
      })
      ref += 1
      end
    end
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end