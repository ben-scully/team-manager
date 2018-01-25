Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :users

  resources :squads do
    resources :squad_members
    resources :games do
      resources :game_members
    end
  end

  root to: "users#index"
end
