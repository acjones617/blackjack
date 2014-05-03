class window.AppView extends Backbone.View

  template: _.template $('#gameOverTemplate').html()

  initialize: ->
    @model.on('change:gameOver', => @renderEndGame())
    @newGame()

  newGame: ->
    @$el.html('')
    @model.newGame();
    gameView = new GameView(model: @model.get 'game')
    @$el.append gameView.$el

  renderEndGame: ->
    @$el.append @template @model.toJSON()
    $('.reset-game').on 'click', => @newGame()

