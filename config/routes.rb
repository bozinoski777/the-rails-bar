Rails.application.routes.draw do
  resources :cocktails do
    resources :doses
  end
  resources :doses, only: [:destroy]
  # get '/cocktails', to: 'cocktail#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
