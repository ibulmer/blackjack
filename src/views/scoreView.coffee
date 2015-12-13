class window.ScoreView extends Backbone.View
  className: 'score'

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<div class="scorevalue"> chips: <%= chips %> bet:<%=bet%> <button class="btn betincrease">+</button> <button class="btn betdecrease">-</button> </div>'

  # template: _.template '<img src = "img/<% if(!obj.revealed) { %><%} else { %> cards/<%=rankName%>-<%=suitName%> <%} %>.png">'
  initialize: -> 
    @render()

  events:
   'click .betincrease': -> @model.incrementBet()
   'click .betdecrease': -> @model.decrementBet()

  # event:
  #   'click':'increase'
    # @trigger  "betIncrease", @
    # 'click .betdecrease': @model.set('bet'), @model.get('bet') - 1

    # call a method on the model/collection connected to that view
      #then that collection, triggered event
      #modlel heard that

  # increase: ->
  #   console.log('increase')

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    
    
    

  
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$('.score').text @collection.scores()[0]
    #     @$el.children().detach()
    # @$el.html @template @collection
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$('.score').text @collection.scores()[0]
