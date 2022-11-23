Rails.application.routes.draw do
  devise_for :users

  root 'home#index', as: 'welcome'
  resources :users
  resources :expenses, except: [:index]
  resources :categories do
    resources :expenses, only: [:index]
  end
end
