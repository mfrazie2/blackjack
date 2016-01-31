assert = chai.assert
should = chai.should
expect = chai.expect

describe 'card', ->
  deck = null
  dealer = null
  hand = null 
  
  beforeEach ->
    deck = new Deck()
    # hand = deck.dealPlayer()
    # dealer = deck.dealDealer()

  describe "deck constructor", ->
    it "should create a card collection", ->
      assert.strictEqual deck.length, 52
      
    it "dealerHits should be a function", ->
      dealer = deck.dealDealer()
      expect(dealer.dealerHits).to.be.a('function')

    #it "should trigger bust event"

  describe 'card model', ->
      it 'should be an object', ->
        expect(deck.models[0]).to.be.an('object')
      it 'should have a flip method', ->
        expect(deck.models[0].flip).to.be.ok
      it 'should have a url property', ->
        expect(deck.models[0].url).to.be.ok