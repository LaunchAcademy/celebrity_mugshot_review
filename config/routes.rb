CelebrityMugshots::Application.routes.draw do

  root "pages#index"
  resources :mugshots do
    resources :comments
  end

  devise_for :users

end
