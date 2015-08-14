class window.Slides
  constructor: ->
    @deck = bespoke.from('#timeline')
    document.body.className = 'classic'
    @initKeys()
    @initClick()
    @initSlideGestures()

  initClick: ->
    $('#timeline').on 'click', 'section', (e) =>
      i = $('#timeline section').index(e.currentTarget)
      @deck.slide(i)

  initKeys: ->
    if /Firefox/.test(navigator.userAgent)
      document.addEventListener 'keydown', (e) ->
        if e.which >= 37 and e.which <= 40
          e.preventDefault()

    document.addEventListener 'keydown', (e) =>
      key = e.which
      key is 37 and @deck.prev()
      (key is 32 or key is 39) and @deck.next()

  initSlideGestures: ->
    main = document.getElementById('main')
    startPosition = undefined
    delta = undefined

    singleTouch = (fn, preventDefault) ->
      (e) ->
        if preventDefault
          e.preventDefault()
        e.touches.length == 1 and fn(e.touches[0].pageX)

    touchstart = singleTouch((position) ->
      startPosition = position
      delta = 0
    )
    touchmove = singleTouch(((position) ->
      delta = position - startPosition
    ), true)

    touchend = =>
      if Math.abs(delta) < 50
        return
      if delta > 0 then @deck.prev() else @deck.next()

    main.addEventListener 'touchstart', touchstart
    main.addEventListener 'touchmove', touchmove
    main.addEventListener 'touchend', touchend
