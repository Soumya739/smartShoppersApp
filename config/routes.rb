Rails.application.routes.draw do
  resources :coupons, :carts
  delete 'warehouses/:id', to: "warehouses#destroy", as: "warehouse_remove"
  resources :warehouses, :items
  get 'orders/convert_cart_to_order', to: "orders#convert_cart_to_order", as: "ordercart"

  get 'delete_user', to: "users#destroy", as: "delete_user"
  resources :users, :orders
  #store_controller
  get 'smartshoppers', to: "stores#index", as: "smartshoppers"
  get 'about', to: "stores#about"
  get 'help', to: "stores#help"
  get 'contact', to: "stores#contact"
  get 'policy', to: "stores#policy"
  get 'stores', to: "stores#stores_detail"
  get 'stores/:id', to: "stores#show", as: "store"
  get 'soum73admin/smartshoppers/stores/new', to: "stores#new"
  post 'soum73admin/smartshoppers/stores/new', to: "stores#create"
  #item_controller
  get 'items', to: "items#index"
  #auth_controller
  get 'smartshoppers/signin', to: "auth#signin"
  post 'smartshoppers/signin', to: "auth#varify"
  get 'smartshoppers/logout', to: "auth#logout"
  #user_controller
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get 'stores/:id/:warehouse_id', to: "stores#add_item_to_cart"

  get 'empty_cart', to: "carts#empty_cart"

  # get 'review_order_path/:id', to: "orders#review_order_path"
  # patch 'review_order_path/:id', to: "orders#post_order_review"

end
