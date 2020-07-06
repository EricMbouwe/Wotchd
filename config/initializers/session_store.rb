# Here we define what the cookies going to be structure like.
## the key here is the name of the session cookie
if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_Wotchd', domain: 'Wotchd-app.heroku.app'
else
  Rails.application.config.session_store :cookie_store, key: '_Wotchd'
end