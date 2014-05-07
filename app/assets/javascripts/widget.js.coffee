window.Widgets = {}
window.Widget =
  init: ->
    $('[data-widget]:not(.initialized)').each (i, widget_container) ->
      element = $(widget_container)
      element.addClass('initialized')
      klassName = element.data('widget')
      klass = window[klassName]
      Widgets[klassName] = new klass(element)

$ ->
  Widget.init()
