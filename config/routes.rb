# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index', as: 'welcome'
  resources :users
  resources :expenses, except: %i[index new create]
  resources :categories do
    resources :expenses, only: %i[index new create]
  end
end
