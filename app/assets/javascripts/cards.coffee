$ ->
  card = $(".card")
  cardFront = $(".card .card-front")
  cardBack = $(".card .card-back")

  hammertime = new Hammer(card)

  downX = 0
  upX = 0

  frontHidden = false
  backHidden = true

  cardBack.hide()

  hammertime.on('tap', (e)->
    target = $(e.target)

    if !target.is('span')
      if frontHidden
        showCardFront()
      else
        showCardBack()
  )

  card.on('mousedown', (e)->
    e.preventDefault()
    downX = e.clientX
  )

  card.on('mouseup', (e)->
    upX = e.clientX

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

  hammertime.on('swipeleft', (e)->
    nextCard() 
  )

  hammertime.on('swiperight', (e)->
    previousCard() 
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

