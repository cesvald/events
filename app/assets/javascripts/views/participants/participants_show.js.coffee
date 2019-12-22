class Lodging.Views.ParticipantsShow extends Backbone.View

	el: 'body'
		
	initialize: ->
		$('a[href="' +window.location.hash+ '"]').tab('show')