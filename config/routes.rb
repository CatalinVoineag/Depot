Rails.application.routes.draw do

  get 	 'login' 	=> 'sessions#new'
  post 	 'login'	=> 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'static_pages#index'

  resources :users
	resources :products
	resources :cart_lines, only: [:index,  :create, :destroy, :edit, :update]
	match '/edit_quantity/:id', to: 'cart_lines#edit_quantity', via: :post, as: :edit_quantity
	resources :carts, only: [:index, :edit, :update]

	resources :orders
#	match '/create_order', to: 'orders#create', via: :post, as: :create_order 

	resources :delivery_addresses
	resources :bill_addresses
	resources :payments

end
