class PostmanWorker
  include Sidekiq::Worker

  def perform(info, count)
    info = JSON.load(info)
    BookingMailer.booking_details(info["name"], info["email"], info["flight_id"]).deliver
  end

  def modify(info, count)
    info = JSON.load(info)
    UpdateMailer.update_details(info["name"], info["email"], info["flight_id"]).deliver
  end

end