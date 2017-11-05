Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :guides, only: [:index, :show] do
    get '/tours', to: 'guides#tours', as: 'tours'  
  end
  resources :salesmen, only: [:index, :show] do
    get '/sales', to: 'salesmen#sales', as: 'sales'
  end
  resources :tours do
    get '/route', to: 'tours#route', as: 'route'
    get '/guide', to: 'tours#guide', as: 'guide'
    get '/sales', to: 'tours#sales', as: 'sales'
  end
  resources :routes do
    get '/tours', to: 'routes#tours', as: 'tours'
  end
  resources :sales do
    get '/salesman', to: 'sales#salesman', as: 'salesman'
    get '/tour', to: 'sales#tour', as: 'tour'
    get '/clients', to: 'sales#clients', as: 'clients'
  end
  resources :clients


end
