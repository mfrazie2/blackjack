class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
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
    [@minScore(), @minScore() + 10 * @hasAce()]
    

  getScore: ->
    bestScore = 0
    if @scores()[0] <= 21 and @scores()[0] > bestScore then bestScore = @scores()[0]
      
  dealerHits: ->
    @at(0).flip()
    while @scores()[0] < 17 then @hit()
    @trigger('dealerHit',@)

  bust: ->
    if @scores()[0] > 21 then @trigger('bust', @)

