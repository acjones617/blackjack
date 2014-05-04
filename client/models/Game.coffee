class window.Game extends Backbone.Model

  initialize : (deck) ->
    deck ||= new Deck()
    @set 'currentDeck', deck
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', => @get('dealerHand').play())
    @get('dealerHand').on('stand', => @gameEnd())
    @get('playerHand').on('lose', => @gameEnd(true))

  gameEnd: (playerBusts) ->
    if playerBusts
      @set 'playerWins', false
      @set 'gameOverMessage', 'Player busts, dealer wins :('
    else
      playerScore = @get('playerHand').score()
      dealerScore = @get('dealerHand').score()
      if playerScore > dealerScore or dealerScore > 21
        gameOverMessage = 'Player wins!'
        @set 'playerWins', true
      else if playerScore < dealerScore
        gameOverMessage = 'Dealer wins'
        @set 'playerWins', false
      else
        gameOverMessage = 'tie...?'
      @set 'gameOverMessage', gameOverMessage

    @trigger 'gameEnd'
