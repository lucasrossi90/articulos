Rails.application.routes.draw do
	resources :articulos
	get 'articulos/search', to: 'articulos#search'


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
