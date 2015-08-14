class window.Timeline

  constructor: (results, @color) ->
    @el = $('.timeline .container')
    @dates = _.map results, (result) -> moment(result.date)
    @start_date =  _.first(@dates)
    @end_date = moment()
    @scale = @end_date.diff(@start_date)/(@el.width() - 15)
    @initSlides()
    @initTimeline()
    @initEvents()

  initSlides: ->
    @slides = new Slides()

  initEvents: ->
    $(document).on 'click', '.marker', (e) =>
      @slides.deck.slide @el.find('.marker').index(e.currentTarget)
    @slides.deck.on 'activate', (event) =>
      @markers.removeClass('current')
      $(@markers[event.index]).addClass('current')

  initTimeline: ->
    @el.attr('data-start', @start_date.format('DD MMM, YYYY'))
    @el.attr('data-end', @end_date.format('DD MMM, YYYY'))
    _.each @dates, (date) =>
      marker = $("<div class='marker' data-date='#{date.format('DD MMM, YYYY')}' style='background: #{@color}'></div>")
      @setPosition(marker, date)
      @el.append(marker)
    @markers = $('.timeline .marker')
    @markers.first().addClass('current')

  setPosition: (marker, date) ->
    position = date.diff(@start_date)/@scale
    marker.css('left', position)
