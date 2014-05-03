class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', => @get('dealerHand').play())
    @get('dealerHand').on('stand', => @gameEnd())
    @get('playerHand').on('lose', => @gameEnd(true))

  gameEnd: (playerBusts) ->
    if playerBusts
      @set 'gameOverMessage', 'Player busts, dealer wins :('
      @set 'playerWins', false
    else
      playerScore = @get('playerHand').score()
      dealerScore = @get('dealerHand').score()
      gameOverMessage = if playerScore > dealerScore or dealerScore > 21 then 'Player wins!'
      else if playerScore < dealerScore then 'Dealer wins'
      else 'tie...?'
      @set 'gameOverMessage', gameOverMessage

    @trigger 'gameEnd'
