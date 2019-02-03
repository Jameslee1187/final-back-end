Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :favorites
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
      post '/users/signup', to: 'users#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
