class window.AppView extends Backbone.View
  className: 'container'

  template: _.template '
    <button class="hit-button btn ">Hit</button> 
    <button class="stand-button btn ">Stand</button>
    <button class="start-button btn ">Deal</button>
    <div class="score-container"></div>  
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .start-button': -> @model.gamestart()
 
  initialize: ->
    @model.on('change', @render, @)
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()

    @$('.score-container').html new ScoreView(model: @model).el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

