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

end
