Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get    '/items',     to: 'items#index'
      get    '/items/:id', to: 'items#show'
      post   '/items',     to: 'items#new'
      put    '/items/:id', to: 'items#update'
      delete '/items/:id', to: 'items#destroy'
    end
  end
end
