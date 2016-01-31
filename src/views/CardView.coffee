class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    if @model.get 'revealed' then @$el.css('background-image', 'url('+ @model.url() + ')' ) else   @$el.addClass 'covered' 
