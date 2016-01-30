# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer() 
    @get('playerHand').on 'stand', => @get('dealerHand').flipCard(@get('playerHand').getScore())
    #  console.log('CoffeeScript')
    # @get('playerHand').getScore()

  