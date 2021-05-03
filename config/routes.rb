Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders
      post '/api/magic', to: 'orders#create'
    end 
  end
end
