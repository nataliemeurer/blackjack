#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    player = @get 'playerHand'
    player.on 'stand', ->

      null
    , this
    @

  deal: ->
    deck = @get 'deck'
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->
    @trigger 'stand', @
    console.log 'standy stand'
    dealer = @get 'dealerHand'
    dealer.first().flip()
    while dealer.scores()[0] < 16 and dealer.scores()[1] < 16
      dealer.hit()
    console.log 'stand event triggered'
