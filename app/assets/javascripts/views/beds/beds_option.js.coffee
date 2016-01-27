class Lodging.Views.BedsOption extends Backbone.View

	template: JST['beds/option']
	tagName: 'option'

	render: ->
		$(@el).html(@template(bed: @model))
		@el.value = @model.get('id')
		this