class window.Newsletter

  constructor: ->
    $('.button').on 'click', =>
      @onClickHandle()

  onClickHandle: ->
      email = $('#email_field').val()
      if @validate email
        @submit(email)
      else
        @showValidationError()

  validate: (email) ->
    re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    re.test(email)

  submit: (email) ->
    @showLoading()
    @fb = new Firebase('https://startlines.firebaseio.com/emails')
    @fb.push email, (error) =>
      if _.isEmpty error
        @showSuccess()
      else
        @showError()

  showLoading: ->
    $('.form .button').addClass('loading')
    $('#email_field').prop('disabled', true)

  showValidationError: ->
    $('.error-container').html('Invalid email')

  showError: ->
    $('.newsletter .form').hide()
    $('.newsletter .error').fadeIn(300)

  showSuccess: ->
    $('.newsletter .form').hide()
    $('.newsletter .success').fadeIn(300)
    Firebase.goOffline()
