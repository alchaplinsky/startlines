(function(){window.Share=function(){function t(t){this.url=t,$(document).on("click",".facebook-link",function(t){return function(){return t.shareFacebook()}}(this)),$(document).on("click",".google-link",function(t){return function(){return t.shareGoogle()}}(this)),$(document).on("click",".twitter-link",function(t){return function(){return t.shareTwitter()}}(this)),$(document).on("click",".linkedin-link",function(t){return function(){return t.shareLinkedin()}}(this))}return t.prototype.facebookUrl="https://www.facebook.com/sharer/sharer.php?u=",t.prototype.pintetersUrl="http://pinterest.com/pin/create/link/?url=",t.prototype.googleUrl="https://plus.google.com/share?url=",t.prototype.twitterUrl="https://twitter.com/intent/tweet?status=",t.prototype.linkedinUrl="https://www.linkedin.com/shareArticle?mini=false&url=",t.prototype.shareFacebook=function(){return this.share(this.facebookUrl,"Facebook")},t.prototype.sharePintetest=function(){return this.share(this.pintetersUrl,"Pinterest")},t.prototype.shareGoogle=function(){return this.share(this.googleUrl,"Google+")},t.prototype.shareTwitter=function(){return this.share(this.twitterUrl+"Explore the history of innovation with startup timelines ","Twitter")},t.prototype.shareLinkedin=function(){return this.share(this.linkedinUrl,"Share link on LinkedIn")},t.prototype.share=function(t,e){return window.open(t+this.url,e,"height=400,width=550")},t}()}).call(this);