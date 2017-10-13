Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :guides, only: [:index, :show]
  resources :salesmen, only: [:index, :show]

end
