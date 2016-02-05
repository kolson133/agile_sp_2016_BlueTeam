# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


first_grade_math = Deck.new(title: "First Grade Math", author: "Frodo Baggins", category: "Math")
first_grade_math.save

flash_card = first_grade_math.cards.build(question: "1 + 1", answer: "2")
flash_card.save

flash_card = first_grade_math.cards.build(question: "3 + 1", answer: "4")
flash_card.save

flash_card = first_grade_math.cards.build(question: "3 + 3", answer: "6")
flash_card.save

flash_card = first_grade_math.cards.build(question: "2 + 8", answer: "10")
flash_card.save
