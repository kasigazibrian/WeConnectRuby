# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  devise_for :users
  resources :businesses do
    resources :reviews
  end

  get 'business/search', to: 'businesses#search'
  get 'business/search_results', to: 'businesses#search_results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
