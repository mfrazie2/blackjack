class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    # @$el.addClass 'covered' unless @model.get 'revealed' 
    # @$el.css('background-image', 'url(' + @model.get('url') + ')' )
    if @model.get 'revealed' then @$el.css('background-image', 'url('+ @model.url() + ')' ) else   @$el.addClass 'covered' 
