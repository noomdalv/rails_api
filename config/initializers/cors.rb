Rails.application.config.middleware.insert_before 0, Rack::Cors do  

  allow do
    origins "https://reactactivitytracker.herokuapp.com"
    resource "*", headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true,
    secure: true,
    same_site: lax
  end

  allow do
    origins "localhost:3000"
    resource "*", headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true
  end
end
