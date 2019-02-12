Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :favorites, except: ["destroy"]
      post '/favorites', to: 'favorites#create'
      delete '/favorites/:team_id', to: 'favorites#destroy'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :teams
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
      post '/users/signup', to: 'users#create'
      post '/users/login', to: 'users#login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
