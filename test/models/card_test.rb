require 'test_helper'

class CardTest < ActiveSupport::TestCase

  test "create_valid_card_within_deck" do
    deck = Deck.new(title: "How to YOLO and be full of SWAG", author: "New Jersey Shore People", category: "Life")
    deck.save

    deck.cards.build
    card = deck.cards.build(question: "Do you even lift?", answer: "Yes")
    assert card.save
  end

  test "cant_create_without_a_answer" do
    card = Card.new(question: "U wot m8")
    assert !card.save
  end

  test "cant_create_without_a_question" do
    card = Card.new(answer: "42")
    assert !card.save
  end

  test "disable card" do
    card = Card.new(question: "12 + 3", answer: "18")
    assert card.is_disabled = true
  end

  test "re-enable card" do
    card = Card.new(question: "14 + 4", answer: "5", is_disabled: true)
    assert !card.is_disabled = false
  end

end
