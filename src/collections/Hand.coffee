class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    #invoke bust every hit
    @add(@deck.pop())
    @bust()

  stand: ->
    @trigger('stand', @)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
    
  #flipCard:(score) ->
  #  @at(0).flip()
  #  console.log('SCORE:', score)
  #  if score > @getScore() then alert('Player won!') else alert('Dealer won!') 

  getScore: ->
    bestScore = 0
    #for score in @scores()
    if @scores()[0] <= 21 and @scores()[0] > bestScore then bestScore = @scores()[0]
      
  dealerHits: ->
    # after stand event
    # dealer flips card
    @at(0).flip()
    # dealer score < 17
      # hit
    while @scores()[0] < 17 then @hit()
    @trigger('dealerHit',@)

  bust: ->
    if @scores()[0] > 21 then @trigger('bust', @)

