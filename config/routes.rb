Rails.application.routes.draw do
  devise_for :users

  root 'home#index', as: 'welcome'
  resources :users
  resources :expenses, except: [:index, :new, :create]
  resources :categories do
    resources :expenses, only: [:index, :new, :create]
  end
end
