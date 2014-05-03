class window.AppView extends Backbone.View

  template: _.template $('#gameOverTemplate').html()
  scoreTemplate: _.template $('#scoreTemplate').html()

  initialize: ->
    @model.on('change:gameEnd', => @renderEndGame())
    @newGame()
    @renderScore()

  newGame: ->
    @$el.html('')
    @model.newGame();
    gameView = new GameView(model: @model.get 'game')
    @$el.append gameView.$el

  renderScore: ->
    @$el.append @scoreTemplate @model.toJSON()

  renderEndGame: ->
    @$el.append @scoreTemplate @model.toJSON()
    @$el.append @template @model.toJSON()
    $('.reset-game').on 'click', => @newGame()

