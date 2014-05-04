class window.App extends Backbone.Model

  initialize: ->
    @set 'chips', 1000
    @set 'bet', 10
    @set 'playerWins', 0
    @set 'dealerWins', 0
    @newGame()

  newGame: (betSize) ->
    @set 'bet', betSize
    console.log(@get('deckUse'), @get('currentDeck'))
    if @get('deckUse') <= 4
      previousDeck = @get('game').get('currentDeck')
      @set 'game', new Game(@get('currentDeck'))
      @set 'deckUse', @get('deckUse') + 1
    else
      @set 'game', new Game()
      @set 'deckUse', 1

    @get('game').on('gameEnd', =>
      @updateScore()
      @set('gameEnd', @get('game').get('gameOverMessage'))
      @trigger 'gameEnd')

    @set 'currentDeck', @get('game').get('currentDeck')

  updateScore: ->
    playerWins = @get('game').get('playerWins')
    if playerWins
      @set('chips', @get('chips') + @get('bet'))
      @set('playerWins', @get('playerWins') + 1)
    else if playerWins is false
      @set('chips', @get('chips') - @get('bet'))
      @set('dealerWins', @get('dealerWins') + 1)

    # console.log(@get('game').get('playerWins'))
    # console.log(@get('playerWins'))

