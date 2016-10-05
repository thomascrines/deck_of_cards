require('pry-byebug')

class Hand

  def initialize(cards)
    @cards = cards
  end

  def number_of_cards()
    return @cards.length
  end

  def has_card(value, suit)
    has_card = false

    for card in @cards
      value_matches = card.value == value
      suit_matches = card.suit == suit
      has_card = true if value_matches && suit_matches
    end

    return has_card
  end

  def to_s()
    return @cards.join(", ")
  end

  def to_bash_coloured_string()
    return @cards.map { |card|
      card.to_bash_coloured_string
    }.join("\n\n")
  end

  def add_card(new_card)
    @cards.push(new_card)
  end

  def remove_card(card_to_remove)

    for card in @cards
      value_matches = card.value == card_to_remove.value
      suit_matches = card.suit == card_to_remove.suit
      if value_matches && suit_matches
        @cards.delete(card)
        return true
      end
    end

    return false
  end

end
