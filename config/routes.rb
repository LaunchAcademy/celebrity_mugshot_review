CelebrityMugshots::Application.routes.draw do

  root "pages#index"
  resources :mugshots

  devise_for :users
  # devise_scope :user do
  #  root to: "devise/registrations#edit"
  # end

end
