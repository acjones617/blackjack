class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<span class="topleft"><%= rankName %><%= suitName %></span>
      <span class="bottomright"><%= rankName %><%= suitName %></span>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    # First line does anything?
    # @$el.children().detach().end().html
    @$el.html @template @model.attributes if @model.get 'revealed'
    @$el.addClass if @model.get('suitName') is '\u2663' or @model.get('suitName') is '\u2660' then 'black' else 'red'
    @$el.addClass 'covered' unless @model.get 'revealed'
