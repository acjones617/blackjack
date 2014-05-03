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
      @set 'winner', 'Player busts, dealer wins :('
    else
      playerScore = @get('playerHand').score()
      dealerScore = @get('dealerHand').score()
      winner = if playerScore > dealerScore or dealerScore > 21 then 'Player wins!'
      else if playerScore < dealerScore then 'Dealer wins'
      else 'tie...?'
      @set 'winner', winner

    @trigger 'gameEnd'
