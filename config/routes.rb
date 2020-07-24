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
	get 'movimiento_stocks/nuevo_movimiento', to: 'movimiento_stocks#nuevo_movimiento'
	get 'movimiento_stocks/search', to: 'movimiento_stocks#search'
	get 'movimiento_stocks/listados', to: 'movimiento_stocks#listados'
	get 'movimiento_stocks/nuevo_listado', to: 'movimiento_stocks#nuevo_listado'

	post 'movimiento_stocks/procesar_entrada', to: 'movimiento_stocks#procesar_entrada'
	post 'rubros/update_fecha_rubro', to: 'rubros#update_fecha_rubro'
	post 'rubros/update_precio_rubro', to: 'rubros#update_precio_rubro'
	resources :articulos
	resources :rubros
	resources :proveedores
	resources :movimiento_stocks
	resources :producto_movidos
	resources :listado_stocks

	


	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
