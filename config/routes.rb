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
	get  '/order/:id/new_payment', to: 'orders#new_payment', as: :order_new_payment
	post '/order/:id/payment', to: 'orders#create_payment', as: :order_create_payment
	get  '/order/:id/confirmation', to: 'orders#order_confirmation', as: :order_confirmation
	post '/order/:id/confirmation', to: 'orders#confirm_order', as: :confirm_order
#	match '/create_order', to: 'orders#create', via: :post, as: :create_order 

	resources :delivery_addresses
	resources :bill_addresses
	resources :payments

end
