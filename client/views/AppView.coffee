class window.AppView extends Backbone.View

  template: _.template $('#restartTemplate').html()

  templateEndGame: _.template $('#gameOverTemplate').html()

  initialize: ->
    @model.on('gameEnd', =>
      @render()
      @gameView.disable())
    scoreView = new ScoreView(model: @model)
    @newGame()

  newGame: ->
    betSize = +$('.bet').val() or 10;
    @$el.html('')
    @model.newGame(betSize);
    @gameView = new GameView(model: @model.get 'game')
    @$el.append @gameView.$el


  render: (bankrupt) ->
    if @model.get('chips') > 0
      @$el.append @template @model.toJSON()
      $('.reset-game').on 'click', => @newGame()
      $('.bet').focus()
      $('.bet').on 'keyup', (e) =>
        @newGame() if e.which is 13
    else
      setTimeout( => @$el.append @templateEndGame, 1500)
