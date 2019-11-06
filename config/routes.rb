Rails.application.routes.draw do
  devise_for :users
	resources :blogs do 
	 member do
	 	put "like", to: "blogs#upvote"
	 end
	 resources :comments
	end
	root "blogs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
