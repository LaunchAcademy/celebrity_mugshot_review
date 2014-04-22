CelebrityMugshots::Application.routes.draw do

  root "pages#index"
  resources :mugshots do
    resources :comments
    resources :votes, only: [:create]
  end

  resources :votes, only: [:destroy]

  devise_for :users

end
