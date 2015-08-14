class window.Layout

  constructor: ->
    @updateHeight()
    $(window).resize => @updateHeight()

  updateHeight: ->
    $('.fader').height $(document).height()

$ ->
  layout = new Layout()
