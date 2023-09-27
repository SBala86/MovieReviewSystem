Rails.application.routes.draw do

  resources :movies, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :edit, :update]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "movies#index"
end
