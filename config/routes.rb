Rails.application.routes.draw do
  resources :team_roles
  resources :team_user_roles
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :users


  resources :teams do
    end

  root to: "users#index"
end
