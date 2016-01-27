class Lodging.Views.HousesOption extends Backbone.View

	template: JST['houses/option']
	tagName: 'option'

	render: ->
		$(@el).html(@template(house: @model))
		@el.value = @model.get('id')
		this