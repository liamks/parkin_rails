# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


class Pages
	constructor: () ->
		@$ul = $("#pages")
		@add_handlers()


	get_order_list: () ->
		output = {}
		output[$(li).attr('data-id')] = i for li,i in @$ul.find('li')
		output


	stop_dragging: () =>
		token = $("meta[name=csrf-token]").attr('content')
		output = 
			'pages': @get_order_list()
			'authenticity_token': token
		$.post('/admin/pages/update_order.json', output)


	add_handlers: () ->
		@$ul.sortable
			handle: '.move'
			stop: @stop_dragging


$ ->
	p = new Pages()