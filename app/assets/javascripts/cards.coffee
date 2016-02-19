$ ->
  card = $(".card")
  cardFront = $(".card .card-front")
  cardBack = $(".card .card-back")

  downX = 0
  upX = 0

  frontHidden = false
  backHidden = true

  cardBack.hide()

  card.mousedown((e)->
    downX = e.clientX
  )

  card.mouseup((e)->
    upX = e.clientX
  )
  
  card.click((e)->

    if downX > upX 
      nextCard()
    else if downX < upX
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
    cards.eq(current).hide()
    cards.eq(current + 1).show()
    current++
    if current > 0
      leftArrow.show()
    if current == cards.length - 1
      rightArrow.hide()
    showCardFront()

  previousCard = ()->
    rightArrow.show()
    cards.eq(current).hide()
    cards.eq(current - 1).show()
    current--
    if current == 0
      leftArrow.hide()
    showCardFront() 

