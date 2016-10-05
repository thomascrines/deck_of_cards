require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../hand')
require_relative('../card')

class TestHand < MiniTest::Test

  def setup()
    cards = [
      Card.new("7", "Diamonds"),
      Card.new("King", "Clubs"),
      Card.new("Ace", "Hearts")
    ]
    @hand = Hand.new(cards)
  end

  def test_number_of_cards_in_hand()
    assert_equal(3, @hand.number_of_cards)
  end

  def test_has_card_true()
    assert(@hand.has_card("King", "Clubs"))
  end

  def test_has_card_false()
    assert_equal(false, @hand.has_card("Queen", "Clubs"))
  end

  def test_to_s()
    expected = "7 of Diamonds, King of Clubs, Ace of Hearts"
    assert_equal(expected, @hand.to_s)
  end

  def test_add_card()
    new_card = Card.new('9', 'Spades')
    @hand.add_card(new_card)
    assert(@hand.has_card('9', 'Spades'))
    assert_equal(4, @hand.number_of_cards)
    puts @hand.to_bash_coloured_string
  end

  def test_remove_card_when_hand_has_card()
    card_to_remove = Card.new("Ace", "Hearts")
    return_value = @hand.remove_card(card_to_remove)
    assert(return_value)
    assert_equal(false, @hand.has_card("Ace", "Hearts"))
    assert_equal(2, @hand.number_of_cards)
  end

  def test_remove_card_when_hand_doesnt_have_card()
    card_to_remove = Card.new("8", "Clubs")
    return_value = @hand.remove_card(card_to_remove)
    assert_equal(false, return_value)
    assert_equal(3, @hand.number_of_cards)
  end

end
