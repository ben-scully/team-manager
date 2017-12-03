Rails.application.routes.draw do
  get 'users/index'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
