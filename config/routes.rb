Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    end
  end

  namespace :api do
    namespace :v1 do
    end
  end

  namespace :api do
    namespace :v1 do
      get 'orders', to: 'orders#index'
      get 'orders/:id', to: 'orders#show'
      resources :items, except: [:new]
    end
  end
end
