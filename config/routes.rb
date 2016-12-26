Rails.application.routes.draw do
  root 'home#index'

  get '/uit_es_creator' => 'home#uit_es_creator'

  mount Messenger::Bot::Space => "/webhook"
end
