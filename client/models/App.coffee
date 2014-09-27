#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    player = @get 'playerHand'
    player.on 'bust', @endGame()
    @

  bust: ->
    @endGame()

  deal: ->
    deck = @get 'deck'
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->
    dealer = @get  'dealerHand'
    dealer.first().flip()
    while dealer.scores()[0] < 16
      if dealer.scores()[1]    #if dealer has an ace
        if dealer.scores()[1] < 16
          console.log('dealer should hit')
          dealer.hit()
        else
          break;
      else
          console.log('dealer should hit')
          dealer.hit()
    @endGame()

  endGame: ->
    player = @get 'playerHand'
    dealer = @get 'dealerHand'
    console.log 'my homie'
    if player.scores()[1]
      if player.scores()[1] <= 21
        playerScore =  player.scores()[1]
      else
        playerScore = player.scores()[0]
    else
      playerScore = player.scores()[0]
    if dealer.scores()[1]
      if dealer.scores()[1] <= 21 then dealerScore =  dealer.scores()[1]
      else
        dealerScore = dealer.scores()[0]
    else
      dealerScore = dealer.scores()[0]
    console.log playerScore
    console.log dealerScore
    if playerScore > dealerScore and playerScore <= 21
      console.log 'player wins'
    else if playerScore > 21
      console.log 'dealer wins'
    else if dealerScore > playerScore and dealerScore <=21
      console.log 'dealer wins'
    else if dealerScore > 21
      console.log 'player wins'
    else if playerScore == dealerScore
      console.log 'Push'
    else
      console.log 'dealer wins'
