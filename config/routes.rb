Rails.application.routes.draw do
  root 'home#index'

  mount Messenger::Bot::Space => "/webhook"
end
