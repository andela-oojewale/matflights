require "delegate"

class BookingPresenter < SimpleDelegator

  def paypal_url(return_path, cost, pass)
    values = {
        business: "ojewaleolaide-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        "quantity": pass.count,
         amount: cost / pass.count
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end