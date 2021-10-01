Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :short_links
    end
  end

  get '/short_links', to: 'short_links#index'
  get '/:short_url', to: 'home#process_short_url'
end
