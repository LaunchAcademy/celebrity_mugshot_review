CelebrityMugshots::Application.routes.draw do

  root "pages#index"

  devise_for :users
  # devise_scope :user do
  #  root to: "devise/registrations#edit"
  # end


  resources :mugshots, only: [:new]

end
