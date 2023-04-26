Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "favorites/index"
  resources :favorites, only: [:index, :create, :destroy]
  root "articles#index"
  resources :articles, only: [:index] do
    collection do
      get 'show/:title', to: 'articles#show', as: :show, constraints: { id: /[0-z\.]+/ }
      get :search
    end
  end

end
