Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :guides, only: [:index, :show] do
    get '/tours', to: 'guides#tours', as: 'tours'  
  end
  resources :salesmen, only: [:index, :show] do
    get '/schedulings', to: 'salesmen#schedulings', as: 'schedulings'
  end
  resources :tours do
    get '/route', to: 'tours#route', as: 'route'
    get '/guide', to: 'tours#guide', as: 'guide'
    get '/schedulings', to: 'tours#schedulings', as: 'schedulings'
  end
  resources :routes do
    get '/tours', to: 'routes#tours', as: 'tours'
  end
  resources :schedulings do
    get '/salesman', to: 'schedulings#salesman', as: 'salesman'
    get '/tour', to: 'schedulings#tour', as: 'tour'
    get '/client', to: 'schedulings#client', as: 'client'
  end
  resources :clients


end
