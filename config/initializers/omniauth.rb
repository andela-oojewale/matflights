Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.on_failure = SessionsController.action(:destroy)
  provider :google_oauth2, ENV["google_client_id"], ENV["google_secret"],
    {
      :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
    provider :facebook, ENV["fb_app_id"], ENV["facebook_id"], scope: "public_profile, email", info_fields: "id, name, link, email"
end