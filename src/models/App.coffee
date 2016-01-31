# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer() 
    @get('playerHand').on 'stand', => @get('dealerHand').dealerHits()
    @get('dealerHand').on 'dealerHit', => @getWinner()
    @get('playerHand').on 'bust', -> alert('Dealer Wins!')
    @get('dealerHand').on 'bust', -> alert('Player Wins!')
  
  getWinner: ->  
    playerScore = @get('playerHand').getScore()
    dealerScore = @get('dealerHand').getScore()
    if playerScore > dealerScore  then alert('Player Wins!') 
    else if playerScore < dealerScore then alert('Dealer Wins!')
    else if playerScore == dealerScore then alert('Tie!')



