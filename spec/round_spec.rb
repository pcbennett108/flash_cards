
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'holds the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(deck).to eq(round.deck)
  end

  it 'starts with no turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
    deck = Deck.new(card_1)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'gets the first card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
  end

  it 'checks the answer' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to eq(true)
  end

  it 'stores a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.turns.first).to eq(new_turn)
  end
  it 'keeps score' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new([card_1])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
  end

  it 'holds the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
  end

  it 'takes another turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
  end

  it 'checks result of second turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")

    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'keeps accurate score' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")

    expect(round.number_correct).to eq(1)
  end

  it 'can score by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")

    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'can score an empty category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")

    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'can return score as percentage' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")
    
    expect(round.percent_correct).to eq(50.0)
  end

  it 'can return score by category as percentage' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    turn_1 = round.take_turn("Juneau")
    turn_2 = round.take_turn("Venus")
    
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end





end
