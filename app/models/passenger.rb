class Passenger < ActiveRecord::Base
  belongs_to :flight

  def self.save_info(provider, user_id, name, email)
    where(provider: provider, user_id: user_id).first_or_create do | client |
      client[:provider] = provider
      client[:user_id] = user_id
      client[:name] = name
      client[:email] = email
    end
  end

end