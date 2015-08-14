class window.Share

  facebookUrl: 'https://www.facebook.com/sharer/sharer.php?u='
  pintetersUrl: 'http://pinterest.com/pin/create/link/?url='
  googleUrl: 'https://plus.google.com/share?url='
  twitterUrl: 'https://twitter.com/intent/tweet?url='

  constructor: (@url) ->
    $(document).on 'click', '.facebook-link', => @shareFacebook()
    $(document).on 'click', '.pinterest-link', => @sharePintetest()
    $(document).on 'click', '.google-link', => @shareGoogle()
    $(document).on 'click', '.twitter-link', => @shareTwitter()

  shareFacebook: ->
    @share(@facebookUrl, 'Facebook')

  sharePintetest: ->
    @share(@pintetersUrl, 'Pinterest')

  shareGoogle: ->
    @share(@googleUrl, 'Google+')

  shareTwitter: ->
    @share(@twitterUrl, 'Twitter')

  share: (url, title) ->
    window.open(url+@url, title, "height=400,width=550")
