CelebrityMugshots::Application.routes.draw do

root to: "home#index"
resources :mugshots

end
