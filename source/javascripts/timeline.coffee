class window.Timeline

  constructor: (dates, @people, @color) ->
    @el = $('.timeline .container')
    @dates = _.map dates, (date) -> moment(date, 'YYYY-MM-DD')
    @start_date =  _.first(@dates)
    @end_date = moment()
    @scale = @end_date.diff(@start_date)/(@el.width() - 15)
    @initMobileBehavior()
    @initSlides()
    @initTimeline()
    @initEvents()
    @initPeople()

  initSlides: ->
    @slides = new Slides()

  initEvents: ->
    $(document).on 'click', '.marker', (e) =>
      @slides.deck.slide @el.find('.marker').index(e.currentTarget)
    @slides.deck.on 'activate', (event) =>
      @markers.removeClass('current')
      $(@markers[event.index]).addClass('current')
    $(window).on 'resize', => @initMobileBehavior()

  initMobileBehavior: ->
    if $(window).width() <= 840
      margin = $('section').outerWidth()/2
      $('section').css('margin-left', "-#{margin}px")

  initTimeline: ->
    @el.attr('data-start', @start_date.format('DD MMM, YYYY'))
    @el.attr('data-end', @end_date.format('DD MMM, YYYY'))
    _.each @dates, (date) =>
      marker = $("<div class='marker' data-date='#{date.format('DD MMM, YYYY')}' style='background: #{@color}'/>")
      @setPosition(marker, date)
      @el.append(marker)
    @markers = $('.timeline .marker')
    @markers.first().addClass('current')

  initPeople: ->
    getPerson = (e) =>
      index = $(e).data('person')
      person = @people[index]
      person.age = moment().diff(moment(person.birthdate), 'years') if person.birthdate is not ''
      template = $('#person').html()
      Mustache.render template, person

    $('a[data-person]').each (i, e) ->
      $(e).webuiPopover
        content: getPerson(e)
        trigger: 'hover'
        animation:'pop'
        placement: 'top'

  setPosition: (marker, date) ->
    position = date.diff(@start_date)/@scale
    marker.css('left', position)
