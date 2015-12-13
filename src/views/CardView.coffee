class window.CardView extends Backbone.View
  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src = "img/cards/<%=rankName%>-<%=suitName%>.png">'
  # template: _.template '<img src = "img/<% if(!obj.revealed) { %><%} else { %> cards/<%=rankName%>-<%=suitName%> <%} %>.png">'
  initialize: -> @render()

    #when click, update the model
  

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.html '<img src = "img/card-back.png">' unless @model.get 'revealed'


