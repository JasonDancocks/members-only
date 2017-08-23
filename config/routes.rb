Rails.application.routes.draw do

	root "posts#index"
	get "/signin", to: "sessions#new"
	delete '/logout',  to: 'sessions#destroy'
	resources :users
	resources :sessions
	resources :posts, only: [:new, :create, :index]
end
