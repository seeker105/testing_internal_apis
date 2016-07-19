Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, except: [:new]
    end
  end
end