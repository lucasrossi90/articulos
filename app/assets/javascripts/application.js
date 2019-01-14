// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require_tree .

function modificar_precio() {

$(".text_costo").keyup(function() {
	$("#articulo_precio").val($("#articulo_costo").val() * $("#articulo_ganancia").val() * 1.21)
	})

$(".text_ganancia").keyup(function() {
    $("#articulo_precio").val($("#articulo_costo").val() * $("#articulo_ganancia").val() * 1.21)
	})

};

function recargar_pagina() {
	window.location.reload();	
};


$('#edit-modal').on('shown.bs.modal', function () {
 	modificar_precio();
});

$('#edit-modal').on('hidden.bs.modal', function () {
    recargar_pagina();
});
