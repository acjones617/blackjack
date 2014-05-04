class window.DeckView extends Backbone.View

  initialize: ->
    console.log('creation')
    @collection.on('change', => @render())
    $('.score').append(@$el)
    @render()


  render: ->
    cards = @collection.length
    @$el.append($("<div><%= cards %> left</div>"))
