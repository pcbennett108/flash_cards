require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'can check guess against answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  it 'gives feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

  it 'can handle incorrect guess' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.feedback).to eq("Incorrect.")
  end
  
end