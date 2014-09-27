class window.CardView extends Backbone.View

  initialize: ->
    @model.on 'change', => @render
    @render()

  className: "card"

  template: _.template '<image src= "img/cards/<%= rankName %>-<%= suitName %>.png"></image>'


  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
