Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      get 'daa/uesc'
    end
  end
end
