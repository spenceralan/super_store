Rails.application.routes.draw do

  root to: "home#index"

  resources :home, only: [:index]

  resources :products do
    resources :reviews
  end

  get 'search' => 'products#search', as: 'search'

end
