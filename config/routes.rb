Rails.application.routes.draw do
  root 'frontpage#index'
  get 'logged_in' => 'frontpage#show'
  get 'sessions/destroy', as: :logout
  get 'auth/twitter/callback' => 'sessions#create'
  get 'auth/twitter', as: :login
  resources :troubles
  patch 'troubles/:id/solve', to: 'trouble#solve', as: 'trouble_solve'
  post 'sessions/finalize', to: 'sessions#finalize'
end
