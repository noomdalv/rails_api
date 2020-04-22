Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allowed_methods = %i[ get post put patch delete options head ]

  allow do
    origins "https://reactactivitytracker.herokuapp.com"
    resource "*", headers: :any, methods: allowed_methods,
    credentials: true,
  end

  allow do
    origins "localhost:3000"
    resource "*", headers: :any, methods: allowed_methods,
    credentials: true
  end
end
