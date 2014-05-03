class window.App extends Backbone.Model

  initialize: ->
    @set 'playerWins', 0
    @set 'dealerWins', 0
    @newGame()


  newGame: ->
    @set 'game', game = new Game()
    @get('game').on('gameEnd', => @updateScore())


  updateScore: ->
    playerWins = @get('game').get('playerWins')
    if playerWins
      @set('playerWins', @get('playerWins') + 1)
    else if playerWins == false
      @set('dealerWins', @get('dealerWins') + 1)

    console.log(@get('playerWins'))
    @set('gameEnd', @get('game').get('gameOverMessage'))

#todo: refactor to have a game beneath the outer blackjack model
# class window.App extends Backbone.Model

#   initialize: ->
#     @newGame()

#   newGame: ->
#     @set 'game', game = new Game()
#     @get('game').on('gameEnd', => @set('gameOver', @get('game').get('winner')))
