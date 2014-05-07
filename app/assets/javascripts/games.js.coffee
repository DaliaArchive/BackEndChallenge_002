class window.Game
  constructor: (el) ->
    @el = $(el)
    @_specifyHandlers()

  areAllMovesSelected: ->
    res = _.map(@el.find("select"), (el) -> $(el).val())
    !_.contains(res, '');

  submitEl: ->
    @el.find('input[type=submit]')

  # === Private methods ===
  _specifyHandlers: ->
    @el.find("select").on 'change', (event)=>
      if @areAllMovesSelected()
        @submitEl().prop('disabled', false);
      else
        @submitEl().prop('disabled', true);


