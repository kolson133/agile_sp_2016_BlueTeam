$ ->
  card = $(".card")
  cardFront = $(".card .card-front")
  cardBack = $(".card .card-back")

  downX = 0
  upX = 0

  frontHidden = false
  backHidden = true

  cardBack.hide()

  card.on('touchstart mousedown', (e)->
    e.preventDefault()
    downX = e.clientX
    touchDownX = e.changedTouches[0].pageX
  )

  card.on('touchend mouseup touchcancel', (e)->
    upX = e.clientX 
    touchUpX = e.changedTouches[0].pageX

    if downX > upX || touchDownX > touchUpX
      nextCard()
    else if downX < upX || touchDownX < touchUpX
      previousCard()
    else
      target = $(e.target)

      if !target.is('span')
        if frontHidden
          showCardFront()
        else
          showCardBack()
  )
  
  cards = $(".card-content")
  leftArrow = $(".arrow-left")
  rightArrow = $(".arrow-right")

  current = 0

  leftArrow.hide()
  cards.eq(0).show()

  rightArrow.click( ->
    nextCard()  
  )

  leftArrow.click( ->
    previousCard()
  )

  showCardFront = ()->
    cardFront.show()
    cardBack.hide()
    frontHidden = false
    backHidden = true

  showCardBack = ()->
    cardFront.hide()
    cardBack.show()
    frontHidden = true
    backhidden = false

  nextCard = ()->
    if rightArrow.is(':visible')
      cards.eq(current).hide()
      cards.eq(current + 1).show()
      current++
      if current > 0
        leftArrow.show()
      if current == cards.length - 1
        rightArrow.hide()
      showCardFront()

  previousCard = ()->
    if leftArrow.is(':visible')
      rightArrow.show()
      cards.eq(current).hide()
      cards.eq(current - 1).show()
      current--
      if current == 0
        leftArrow.hide()
      showCardFront() 

