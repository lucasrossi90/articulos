Rails.application.routes.draw do
	get 'articulos/search', to: 'articulos#search'
	get 'articulos/mas', to: 'articulos#mas'
	get 'articulos/update_fecha_rubro', to: 'articulos#update_fecha_rubro'
	resources :articulos
	resources :rubros
	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
