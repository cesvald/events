class Lodging.Views.RoomsOption extends Backbone.View

	template: JST['rooms/option']
	tagName: 'option'

	render: ->
		$(@el).html(@template(room: @model))
		@el.value = @model.get('id')
		this