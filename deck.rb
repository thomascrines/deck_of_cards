require_relative("hand")

class Deck

  SUITS = [
    'Hearts',
    'Clubs',
    'Diamonds',
    'Spades'
  ]

  VALUES = {
    'Ace' => 1,
    '3' => 3,
    '2' => 2,
    '4' => 4,
    '6' => 6,
    '5' => 5,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13
  }

  def initialize()
    initialize_cards()
  end

  def initialize_cards()
    @cards = []

    for suit in SUITS
      for value, value_index in get_ordered_values
        @cards.push(Card.new(value, suit))
      end
    end
  end

  def shuffle()
    shuffled_cards = []
    while @cards.length > 0
      card = @cards.sample
      shuffled_cards.push(card)
      @cards.delete(card)
    end
    @cards = shuffled_cards
  end

  def number_of_cards_remaining()
    return @cards.length()
  end

  def deal_card()
    return @cards.shift()
  end

  def get_ordered_values()
    return VALUES.to_a.map { |pair|
      pair.reverse
    }.sort.map { |pair|
      pair[1]
    }
  end

  def deal_hands(hand_count, card_count)
    hands = []
    hand_count.times do
      hands.push(Hand.new([]))
    end

    card_count.times do
      for hand in hands
        hand.add_card(deal_card)
      end
    end
    return hands
  end

  def to_s ()
    @cards.join(", ")
  end

  def to_bash_coloured_string()
    @cards.map { |card|
      card.to_bash_coloured_string
    }.join("\n")
  end

end
