
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
    attr_reader :deck, :turns, :number_correct, :card_count
    def initialize(deck)
      @deck = deck
      @turns = []
      @number_correct = 0
      @card_count = 0
    end 

    def current_card
      deck.cards[card_count]
    end
    
    def take_turn(guess)
      current_turn = Turn.new(guess, current_card)
      @turns << current_turn
      @number_correct += 1 if current_turn.correct?
      @card_count += 1
      current_turn
    end

    def number_correct_by_category(category)
      cat_match = turns.find_all { |turn| turn.card.category == category }
      number_correct = 0
      cat_match.each do |match|
        number_correct += 1 if match.guess == match.card.answer
      end
      number_correct
    end

    def percent_correct
      number_correct.to_f / card_count.to_f * 100
    end

    def percent_correct_by_category(category)
      category_total = deck.cards_in_category(category)
      number_correct_by_category(category).to_f / category_total.length.to_f * 100
    end

    def start
      tries = 0
      puts "Welcome! You're playing with 4 cards."
      puts "-------------------------------------------------"

      while tries < deck.count
        puts "This is card number #{card_count + 1} out of #{deck.count}."
        puts "Question: #{current_card.question}"
        guess = gets.chomp
        turn = take_turn(guess)
        #? why would it not work without the var assignment - wrong num of args
        p turn.feedback
        puts ""
        tries += 1
      end

      puts "****** Game over! ******"
      puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct}%"
      puts "STEM - #{percent_correct_by_category(:STEM)}% correct"
      puts "Geography - #{percent_correct_by_category(:Geography)}% correct"
    end


end
#? suggestions for cleaning up block @ 27
#?  Why pry is not working here even with require at top
#? best way to see inside of specific block