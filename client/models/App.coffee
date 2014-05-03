class window.App extends Backbone.Model

  initialize: ->
    @set 'playerWins', 0
    @set 'dealerWins', 0
    @newGame()

  newGame: ->
    @set 'game', game = new Game()
    @get('game').on('gameEnd', =>
      @updateScore()
      @set('gameEnd', @get('game').get('gameOverMessage'))
      @trigger 'gameEnd')

  updateScore: ->
    playerWins = @get('game').get('playerWins')
    if playerWins
      @set('playerWins', @get('playerWins') + 1)
    else if playerWins is false
      @set('dealerWins', @get('dealerWins') + 1)

    # console.log(@get('game').get('playerWins'))
    # console.log(@get('playerWins'))

