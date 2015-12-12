assert = chai.assert
expect = chai.expect

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'started properly', ->
    it 'creates a deck on initialize', ->
      expect(deck.dealPlayer).to.have.been.called
    # it 'initiated just once', ->
    #   expect(deck.dealPlayer).to.have.callCount(1)

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'deal', ->
    it 'should populate dealer hand as expected', ->
      cardSearch = deck.at(deck.length-3)
      player = deck.dealPlayer()
      dealer = deck.dealDealer()
      assert.strictEqual dealer.at(0), cardSearch
    
#calledWith('enqueue', model);