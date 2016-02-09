# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $ ->

    cardFront = $(".card > .card-front")
    cardBack = $(".card > .card-back")

    frontHidden = false
    backHidden = true

    cardBack.hide()

    $(".card").click(->
      if frontHidden
        cardFront.show()
        cardBack.hide()
        frontHidden = false
        backHidden = true
      else
        cardFront.hide()
        cardBack.show()
        frontHidden = true
        backhidden = false
    )
    
