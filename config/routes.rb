Rails.application.routes.draw do
  root 'home#index'

  get '/uit_es_creator' => 'home#uit_es_creator'
  patch "/show_notifs" => 'home#show_notifs'

  namespace :api do
    namespace :v1 do
      get 'daa/datasource'
    end
  end

  mount Messenger::Bot::Space => "/webhook"
end
