(function(){window.Newsletter=function(){function t(){$(".button").on("click",function(t){return function(){return t.onClickHandle()}}(this))}return t.prototype.onClickHandle=function(){var t;return t=$("#email_field").val(),this.validate(t)?this.submit(t):this.showValidationError()},t.prototype.validate=function(t){var r;return r=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i,r.test(t)},t.prototype.submit=function(t){return this.fb=new Firebase("https://startlines.firebaseio.com/emails"),this.fb.push(t,function(t){return function(r){return _.isEmpty(r)?t.showSuccess():t.showError()}}(this))},t.prototype.showValidationError=function(){return $(".error-container").html("Invalid email")},t.prototype.showError=function(){return $(".newsletter .form").hide(),$(".newsletter .error").fadeIn(300)},t.prototype.showSuccess=function(){return $(".newsletter .form").hide(),$(".newsletter .success").fadeIn(300)},t}()}).call(this);