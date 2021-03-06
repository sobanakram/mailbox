Rails.application.routes.draw do

  root 'emails#index'
  devise_for :users

  resources :emails, only: :show do
    get :content, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
