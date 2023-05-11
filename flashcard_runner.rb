require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the highest mountain in North America?", "Denali", :Geography)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
# turn_1 = round.take_turn("Juneau")
# turn_2 = round.take_turn("Venus")


#require "pry" ; binding.pry


tries = 0
puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"

while tries < deck.count
  puts "This is card number #{round.card_count + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  turn = round.take_turn(guess)
  #? why would it not work without the var assignment - wrong num of args
  p turn.feedback
  puts ""
  tries += 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"