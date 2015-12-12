class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
  
  # stand: -> 
  #   @model.get('dealerHand').at(0).flip()
  #   playerHandScore = if @model.get('playerHand').scores()[1] > 21 then @model.get('playerHand').scores()[0] else @model.get('playerHand').scores()[1] 
    
  #   while (@model.get('dealerHand').scores()[1] < 17 || (@model.get('dealerHand').scores()[1] > 21 && @model.get('dealerHand').scores()[0] < 17) )
  #     @model.get('dealerHand').hit()
  #     console.log('dealer hit')

  #   if @model.get('dealerHand').scores()[1] < playerHandScore || @model.get('dealerHand').scores()[0] > 21
  #     console.log('player wins')
  #   else if @model.get('dealerHand').scores()[1] == playerHandScore
  #      console.log("e")
  #   else
  #     console.log('dealer wins')

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

