require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  test "creates a valid deck" do
    deck = Deck.new
    deck.title = "Test Deck"
    deck.author = "Zach"
    deck.category = "cats"
    deck.color_type = "Teal"
    deck.font_type = "Bold"
    
    assert deck.save
  end

  test "should not save unless title is filled in" do
    deck = Deck.new
    assert !deck.save
  end

  test "should not save unless Author is filled in" do
    deck = Deck.new
    deck.title = "new deck"
    assert !deck.save
  end

  test "should only have one deck with the same name" do
    deck = Deck.new(:title =>"Test")
    deck.valid?
    assert deck.errors[:title].any?
  end

end

