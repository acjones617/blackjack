class window.AppView extends Backbone.View

  template: _.template $('#gameOverTemplate').html()

  initialize: ->
    @model.on('change:gameOver', => @render())
    @newGame()

  newGame: ->
    @$el.html('')
    gameView = new GameView(model: @model.get 'game')
    @$el.append gameView.$el

  render: ->
    @$el.append @template @model.toJSON()

