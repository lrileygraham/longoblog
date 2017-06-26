Rails.application.routes.draw do

  devise_for :users
  resources :photos
    resources :posts do
      resources :comments
    end

    root "posts#index"

    get '/photos', to: 'photos#index'
end
