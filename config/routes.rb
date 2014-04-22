CelebrityMugshots::Application.routes.draw do

  root "mugshots#index"
  resources :mugshots do
    resources :comments
    resources :votes, only: [:create]
  end

  resources :votes, only: [:destroy]

  devise_for :users

end
