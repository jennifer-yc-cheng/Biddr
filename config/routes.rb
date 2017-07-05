Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index', as: 'home'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]

  resources :auctions do
    get '/bidded', to: 'auctions#bidded', on: :collection
    get '/watched', to: 'auctions#watched', on: :collection
    resources :publishings, only: :create
    resources :bids, only: [:create]
    resources :watches, only: [:create, :destroy]
  end
end
