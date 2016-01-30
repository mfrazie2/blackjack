# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer() 
    @get('playerHand').on 'stand', => @get('dealerHand').dealerHits()
    @get('dealerHand').on 'dealerHit', => @getWinner()
  getWinner: ->  
    playerScore = @get('playerHand').getScore()
    dealerScore = @get('dealerHand').getScore()
    if playerScore > dealerScore  then alert('Player Wins!') else alert('Dealer Wins!')



    #  console.log('CoffeeScript')
    # @get('playerHand').getScore()
    #
    
  # tabulate playerScore
  # tabulate dealerScore
  # if dealerScore< 17, hit()
    # if dealerScore >= 17, do nothing
  # compare scores and alert winner