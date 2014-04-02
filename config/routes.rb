CelebrityMugshots::Application.routes.draw do

root to: "home#index"
resources :mugshots, only: [:new, :index, :edit, :delete]

end
