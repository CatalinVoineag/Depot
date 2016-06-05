Rails.application.routes.draw do
  
  get 	 'login' 	=> 'sessions#new'
  post 	 'login'	=> 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'static_pages#index'

  resources :users

  resources :products

end
