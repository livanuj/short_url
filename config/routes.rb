Rails.application.routes.draw do

  root 'home#index'
  resources :pages

  get '/', to: 'home#index'
end
