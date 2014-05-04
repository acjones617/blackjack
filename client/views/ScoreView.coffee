class window.ScoreView extends Backbone.View

  template: _.template $('#scoreTemplate').html()

  initialize: ->
    @model.on('change', => @render())
    @render()
    $('body').prepend(@$el)

  render: ->
    @$el.html('')
    @$el.append @template @model.toJSON()


