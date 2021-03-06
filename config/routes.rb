Seatyourself::Application.routes.draw do
  get "users/new"
  get "users/edit"
  get "users/show"
  get "welcome_path" => "welcome#index"
  get '/users/:user_id/join/:id' => "users#joinnew"
  resources :sessions
  root "welcome#index"
  resources :users do
    resources :categories 
    resources :reservations
  end
  resources :restaurants do
    resources :moments
    resources :menus
  end
  resources :menus do
    resources :items
  end

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get '/sessions' => 'sessions#create'

  match '/users/:user_id/join/:id', to: "users#joinnew", via: [:get,:post]
  get '/users/:user_id/:restaurants_id/rate' => "restaurants#rate"
  get "/users/:id/time" => "restaurants#index"
  get "/users/:id/reserve" => "restaurants#reserve"
  get "/users/:user_id/:restaurant_id/:menu_id/:item_id" => "orders#create"
  get "/restaurants/:restaurant_id/:menu_id"=> "menus#show"
  get "/remove/:restaurant_id/:menu_id/:order_id/:id" => "orders#remove"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
