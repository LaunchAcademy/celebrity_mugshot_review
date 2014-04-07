CelebrityMugshots::Application.routes.draw do

  root "pages#index"
  resources :mugshots

  devise_for :users

end
