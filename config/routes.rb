Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'emails#index'
  devise_for :users

  resources :emails, only: :show do
    get :content, on: :member
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
