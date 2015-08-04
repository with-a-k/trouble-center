Rails.application.routes.draw do
  root 'frontpage#index'
  get 'logged_in' => 'frontpage#show'
end
