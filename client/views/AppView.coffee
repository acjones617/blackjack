class window.AppView extends Backbone.View

  template: _.template $('#gameOverTemplate').html()


  initialize: ->
    @model.on('gameEnd', =>
      @renderEndGame()
      @gameView.disable())
    scoreView = new ScoreView(model: @model)
    @newGame()

  newGame: ->
    @$el.html('')
    @model.newGame();
    @gameView = new GameView(model: @model.get 'game')
    @$el.append @gameView.$el


  renderEndGame: ->
    @$el.append @template @model.toJSON()
    $('.reset-game').on 'click', => @newGame()


class window.ScoreView extends Backbone.View

  template: _.template $('#scoreTemplate').html()

  initialize: ->
    console.log('whatup')
    @model.on('change:playerWins', => @render())
    @model.on('change:dealerWins', => @render())
    @render()
    $('body').prepend(@$el)

  render: ->
    console.log('scoreview')
    @$el.html('')
    @$el.append @template @model.toJSON()

