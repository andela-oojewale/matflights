class User < ActiveRecord::Base

  def self.save_info(provider, user_id, name, email)
    where(provider: provider, user_code: user_id).first_or_create do | client |
      client[:provider] = provider
      client[:user_code] = user_id
      client[:name] = name
      client[:email] = email
    end
  end

end