class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    # console.log('deck creation')
    @add _(_.range(0, 52)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [ @pop(), @pop() ], @

  dealDealer: -> new DealerHand [ @pop().flip(), @pop() ], @
