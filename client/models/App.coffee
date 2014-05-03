#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @newGame()

  newGame: ->
    @set 'game', game = new Game()
    @get('game').on('gameEnd', => @set('gameOver', @get('game').get('winner')))
