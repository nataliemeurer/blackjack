#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    player = @get 'playerHand'
    player.on 'stand', ->
      dealer = @get 'dealerHand'
      dealer.first().flip()
      console.log dealer.scores()
      while dealer.scores()[0] < 16 and dealer.scores()[1] < 16 then dealer.hit()
      null
    , this
    @

