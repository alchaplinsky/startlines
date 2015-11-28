class window.Share

  facebookUrl: 'https://www.facebook.com/sharer/sharer.php?u='
  pintetersUrl: 'http://pinterest.com/pin/create/link/?url='
  googleUrl: 'https://plus.google.com/share?url='
  twitterUrl: 'https://twitter.com/intent/tweet?status='
  linkedinUrl: 'https://www.linkedin.com/shareArticle?mini=false&url='

  constructor: (@url) ->
    $(document).on 'click', '.facebook-link', => @shareFacebook()
    $(document).on 'click', '.google-link', => @shareGoogle()
    $(document).on 'click', '.twitter-link', => @shareTwitter()
    $(document).on 'click', '.linkedin-link', => @shareLinkedin()

  shareFacebook: ->
    @share(@facebookUrl, 'Facebook')

  sharePintetest: ->
    @share(@pintetersUrl, 'Pinterest')

  shareGoogle: ->
    @share(@googleUrl, 'Google+')

  shareTwitter: ->
    @share(@twitterUrl+'Explore the history of innovation with startup timelines ', 'Twitter')

  shareLinkedin: ->
    @share(@linkedinUrl, 'Share link on LinkedIn')

  share: (url, title) ->
    window.open(url+@url, title, "height=400,width=550")
