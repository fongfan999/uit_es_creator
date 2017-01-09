Messenger::Bot.config do |config|
  config.access_token = ENV['BOT_ACCESS_TOKEN']
  config.validation_token = ENV['BOT_VALIDATION_TOKEN']
  config.secret_token = ENV['BOT_SECRET_TOKEN']
end