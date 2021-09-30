Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  resources :pages

  get '/', to: 'home#index'
end
