Rails.application.routes.draw do
	get 'articulos/search', to: 'articulos#search'
	get 'rubros/search', to: 'rubros#search'
	get 'rubros/search_articulos', to: 'rubros#search_articulos'
	get 'articulos/mas', to: 'articulos#mas'
	get 'articulos/:id/delete', to: 'articulos#delete', as: 'delete'
	get 'rubros/:id/delete', to: 'rubros#delete', as: 'rubros/delete'
	get 'rubros/edit_fecha_rubro', to: 'rubros#edit_fecha_rubro'
	get 'rubros/edit_precio_rubro', to: 'rubros#edit_precio_rubro'
	get 'rubros/rubro_articulos', to: 'rubros#rubro_articulos'
	get 'rubros/destroy_confirm', to: 'rubros#destroy_confirm'
	get 'movimiento_stocks/nueva_entrada', to: 'movimiento_stocks#nueva_entrada'
	post 'rubros/update_fecha_rubro', to: 'rubros#update_fecha_rubro'
	post 'rubros/update_precio_rubro', to: 'rubros#update_precio_rubro'
	resources :articulos
	resources :rubros
	resources :proveedores
	resources :movimiento_stocks
	resources :producto_movidos

	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
