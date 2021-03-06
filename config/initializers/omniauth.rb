
if Rails.env == "production"
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['twitter_id'], ENV['twitter_secret'] 
  end
else
  twitter_secrets = YAML::load_file('config/omniauth.yml')[Rails.env]
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, twitter_secrets['twitter_id'], twitter_secrets['twitter_secret'] 
  end
end