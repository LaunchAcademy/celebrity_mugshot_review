CelebrityMugshots::Application.routes.draw do

  root "mugshots#index"
  resources :mugshots do
    resources :comments
  end

  devise_for :users

end
