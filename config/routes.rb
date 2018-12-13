Rails.application.routes.draw do
	get 'articulos/search', to: 'articulos#search'
	resources :articulos
	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
