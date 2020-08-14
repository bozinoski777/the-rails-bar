Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, except: :index do
    resources :doses
  end
  resources :doses, only: [:destroy]
  # get '/cocktails', to: 'cocktail#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
