Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "119765518512-j2thdvr4ce7223006ggms3p9irnqi52g.apps.googleusercontent.com", "HcXGDK7hNl-gt_FUDrns_AlM",
    {
      :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end