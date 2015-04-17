Rails.application.routes.draw do
  get 'sessions/new'

  get 'events', to: 'events#index'
  post 'events', to: 'events#index'
  post 'events/edit', to: 'events#edit'
  patch 'events/edit', to: 'events#edit'
  post 'events/destory', to: 'events#destory'
  resources :users
  get 'users/new'

  #get 'pages/events'

  #get 'pages/about'
  get 'about', to: 'pages#about'
  get 'partners', to: 'pages#partners'
  get 'help', to: 'pages#help'
  get 'resources', to: 'pages#resources'
  get 'inventory', to: 'pages#inventory'
  get 'contact', to: 'contact#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  #homepage contact routes
  get 'welcome/index'
  post 'welcome/edit'
  put 'welcome/update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
