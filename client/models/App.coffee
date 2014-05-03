#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'game', game = new Game()
    @get('game').on('gameEnd', => @set('gameOver', @get('game').get('winner')))
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()
    # @get('playerHand').on('stand', => @get('dealerHand').play())
    # @get('dealerHand').on('stand', => @gameEnd())
    # @get('playerHand').on('lose', => @gameEnd(true))

  # gameEnd: (playerBusts) ->
  #   if playerBusts
  #     @set 'winner', 'Player busts, dealer wins :('
  #     return
  #   playerScore = @get('playerHand').score()
  #   dealerScore = @get('dealerHand').score()
  #   winner = if playerScore > dealerScore or dealerScore > 21 then 'Player wins!'
  #   else if playerScore < dealerScore then 'Dealer wins'
  #   else 'tie...?'

  #   @set 'winner', winner
