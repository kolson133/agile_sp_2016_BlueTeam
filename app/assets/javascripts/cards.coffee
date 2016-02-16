# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $ ->
    cardFront = $(".card .card-front")
    cardBack = $(".card .card-back")

    frontHidden = false
    backHidden = true

    cardBack.hide()

    $(".card").click((e)->

      target = $(e.target)

      if !target.is('span')
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


    

    cards = $(".card-content")
    leftArrow = $(".arrow-left")
    rightArrow = $(".arrow-right")

    current = 0

    leftArrow.hide()
    cards.eq(0).show()

    rightArrow.click( ->
      
      cards.eq(current).hide()
      cards.eq(current + 1).show()

      current++

      if current > 0
        leftArrow.show()

      if current == cards.length - 1
        rightArrow.hide()


      cardFront.show()
      cardBack.hide()
      frontHidden = false
      backHidden = true
    )

    leftArrow.click( ->

      rightArrow.show()
    
      cards.eq(current).hide()
      cards.eq(current - 1).show()

      current--

      if current == 0
        leftArrow.hide()
    
      cardFront.show()
      cardBack.hide()
      frontHidden = false
      backHidden = true

    )









    
    
