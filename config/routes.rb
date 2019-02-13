Rails.application.routes.draw do
	get 'articulos/search', to: 'articulos#search'
	get 'rubros/search', to: 'rubros#search'
	get 'articulos/mas', to: 'articulos#mas'
	get 'rubros/update_fecha_rubro', to: 'rubros#update_fecha_rubro'
	resources :articulos
	resources :rubros
	resources :proveedores
	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
