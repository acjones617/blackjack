class window.DealerHand extends Hand

  isDealer: true

  play: ->
    # flips hidden dealer card
    @each ((card) -> card.flip() if not card.get('revealed'))
    # hits until score greater than or equal to 17
    @hit() until @score() >= 17
    @stand()


