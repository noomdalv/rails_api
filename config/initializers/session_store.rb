if Rails.env == "production"
  Rails.application.config.session_store :cookie_store,
  key: "_authentication_app",
  domain: "https://activitytrackerapi.herokuapp.com",
  httponly: false

else
  Rails.application.config.session_store :cookie_store,
  key: "_authentication_app"
end
