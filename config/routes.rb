Rails.application.routes.draw do
	get 'articulos/search', to: 'articulos#search'
	get 'rubros/search', to: 'rubros#search'
	get 'rubros/search_articulos', to: 'rubros#search_articulos'
	get 'articulos/mas', to: 'articulos#mas'
	get 'rubros/edit_fecha_rubro', to: 'rubros#edit_fecha_rubro'
	get 'rubros/edit_precio_rubro', to: 'rubros#edit_precio_rubro'
	get 'rubros/rubro_articulos', to: 'rubros#rubro_articulos'
	resources :articulos
	resources :rubros
	resources :proveedores
	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
