Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # insert the rule for the domains
  allow do
    origins 'http://localhost:3000' # local server of the front-end app
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :option, :head],
                  credentials: true # allow to pass the cookies from the front-end app to the back-end
  end

  allow do
    origins 'https://wotchd.herokuapp.com/' # production server of the front-end app
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :option, :head],
                  credentials: true # allow to pass the cookies from the front-end app to the back-end
  end
end
