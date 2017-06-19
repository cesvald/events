class Lodging.Views.SpacesOption extends Backbone.View

	template: JST['spaces/option']
	tagName: 'option'

	render: ->
		$(@el).html(@template(space: @model))
		@el.value = @model.get('id')
		this