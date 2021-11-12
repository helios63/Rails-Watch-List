Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :movies do
    resources :bookmarks
  end
  resources :lists
  delete '/delete', to: 'bookmarks#destroy'
end
