Rails.application.routes.draw do
  root 'frontpage#index'
  get 'logged_in' => 'frontpage#show'
  get 'sessions/destroy', as: :logout
  get 'auth/twitter/callback'=> 'sessions#create'
  get '/login' => 'auth/twitter'
end
