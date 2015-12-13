# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  defaults: 
    gamecount: 0, 
    chips: 1000
    bet: 1     

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    @get('playerHand').on('hit', @hitting, @)
    @get('playerHand').on('stand', @standing, @)
  
  gamestart: ->
    @set 'gamecount', @incrementgame()
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('hit', @hitting, @)
    @get('playerHand').on('stand', @standing, @)


  incrementgame: ->
    @get('gamecount') + 1

  incrementBet: ->
    @set 'bet', (@get 'bet')+1
    

  decrementBet: ->
    if (@get 'bet') > 0
     @set 'bet', (@get 'bet')-1
    else
     @set 'bet', 0  

  hitting: ->
    console.log("we hit")
    playerHandScore = if @get('playerHand').scores()[1] > 21 then @get('playerHand').scores()[0] else @get('playerHand').scores()[1] 
    if playerHandScore > 21 
      @standing()

  standing: ->
    @get('dealerHand').at(0).flip()
    playerHandScore = if @get('playerHand').scores()[1] > 21 then @get('playerHand').scores()[0] else @get('playerHand').scores()[1] 
    
    if playerHandScore > 21
      @set 'chips', (@get 'chips') - 1 * (@get 'bet')
      # alert('dealer wins')
      console.log(playerHandScore + ":" )
      @gamestart()
    else 

      while (@get('dealerHand').scores()[1] < 17 || (@get('dealerHand').scores()[1] > 21 && @get('dealerHand').scores()[0] < 17) )
        @get('dealerHand').hit()
        console.log('dealer hit')

      if @get('dealerHand').scores()[1] < playerHandScore || @get('dealerHand').scores()[0] > 21
        # alert('player wins')
        @set 'chips', (@get 'chips') + 1 * (@get 'bet')
        @gamestart()
        
      else if @get('dealerHand').scores()[1] == playerHandScore
         # alert("draw")
         @gamestart()

      else
        @set 'chips', (@get 'chips') - 1 * (@get 'bet')
        # alert('dealer wins')
        @gamestart()

