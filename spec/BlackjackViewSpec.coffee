assert = chai.assert
expect = chai.expect

describe "game logic", ->

# deck = new Deck()
# deck.push(deck.splice(deck.indexOf(card) ,1)[0]) for card in deck when card.rankName == 'Ace'
# console.log(deck)

  #it "should create a card collection", ->
    
    # collection = new Deck()
    # assert.strictEqual collection.length, 52


describe "the card view should render with the app view", ->
    collection = new Deck()
    new AppView(model: new App())
    # .$el.appendTo 'body'
    #console.log(cardView)
    #expect(cardView.render).to.have.callCount(1)