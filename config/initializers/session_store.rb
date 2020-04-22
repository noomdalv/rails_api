if Rails.env == "production"
  Rails.application.config.session_store :cookie_store,
  key: "_authentication_app",
  domain: "https://activitytrackerapi.herokuapp.com",
  secure: true,
  same_site: lax
else
  Rails.application.config.session_store :cookie_store,
  key: "_authentication_app"
end
