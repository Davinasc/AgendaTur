Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :guides, only: [:index, :show] do
    get '/tours', to: 'guides#tours', as: 'tours'  
  end
  resources :salesmen, only: [:index, :show]
  resources :tours do
    get '/route', to: 'tours#route', as: 'route'
    get '/guide', to: 'tours#guide', as: 'guide'
  end
  resources :routes do
    get '/tours', to: 'routes#tours', as: 'tours'
  end



end
