assert = chai.assert
should = chai.should
expect = chai.expect

describe 'Blackjack View', ->
  app = null
  appView = null
  
  beforeEach ->
    app = new App()
    appView = new AppView({model : app})
  
  describe 'AppView', ->
  it 'should check if appView is instanceof AppView', ->
    expect(appView).to.be.an.instanceof(AppView)
  
  describe 'App', ->
    it 'should have a deck', ->
      expect(app.get 'deck').to.be.an.instanceof(Deck)
    
    it 'should have a player hand', ->
      expect(app.get 'playerHand').to.be.an.instanceof(Hand)

    it 'should have a dealer hand', ->
      expect(app.get 'dealerHand').to.be.an.instanceof(Hand)



