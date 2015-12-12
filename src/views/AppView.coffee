class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @stand()
  
  stand: -> 
    @model.get('dealerHand').at(0).flip()
    while (@model.get('dealerHand').dealerScore() < 17 )
      @model.get('dealerHand').hit()
      console.log('dealer hit')
    if @model.get('dealerHand').dealerScore() < @model.get('playerHand').scores()[0]
      console.log('player wins')
    else
      console.log('dearler wins')
  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

