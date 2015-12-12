class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
     #listenere intiiated

     # firs time [r1, r2], this, true/false

     #listen for change in the minscore && the score is less than 21
        #if so, next event
     @.on 'add', => if ((@scores()[0]) > 21)
      console.log('you lose')

  # listen to the dealer?
  stand: -> 

  hit: ->
    @add(@deck.pop())
    @last()
    # event triggered every time 

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  dealerScore: -> @reduce (score, card) ->
    score + card.get 'value'
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


