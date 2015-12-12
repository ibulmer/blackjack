# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('hit', @hitting, @)
    @get('playerHand').on('stand', @standing, @)

  hitting: ->
    console.log("we hit")

  standing: ->
    @get('dealerHand').at(0).flip()
    playerHandScore = if @get('playerHand').scores()[1] > 21 then @get('playerHand').scores()[0] else @get('playerHand').scores()[1] 
    
    while (@get('dealerHand').scores()[1] < 17 || (@get('dealerHand').scores()[1] > 21 && @get('dealerHand').scores()[0] < 17) )
      @get('dealerHand').hit()
      console.log('dealer hit')

    if @get('dealerHand').scores()[1] < playerHandScore || @get('dealerHand').scores()[0] > 21
      console.log('player wins')
    else if @get('dealerHand').scores()[1] == playerHandScore
       console.log("e")
    else
      console.log('dealer wins')
