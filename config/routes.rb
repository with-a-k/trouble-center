Rails.application.routes.draw do
  root 'frontpage#index'
  get 'sessions/destroy', as: :logout
  get 'auth/twitter/callback' => 'sessions#create'
  get 'auth/twitter', as: :login
  resources :troubles
  patch 'troubles/:id/solve', to: 'troubles#solve', as: 'trouble_solve'
  patch 'troubles/:id/accept', to: 'troubles#assign', as: 'trouble_accept'
  post 'sessions/finalize', to: 'sessions#finalize'
  get '/yours', to: 'frontpage#owned', as: 'user_owned_troubles'
  get '/solving', to: 'frontpage#solving', as: 'user_accepted_troubles'
  get '/solved', to: 'frontpage#solved', as: 'solved_troubles'
end
