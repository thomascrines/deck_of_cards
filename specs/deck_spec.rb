require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../deck')
require_relative('../card')

class TestDeck < MiniTest::Test

  def setup()
    @deck = Deck.new()
  end

  def test_new_deck_has_52_cards()
    assert_equal(52, @deck.number_of_cards_remaining)
  end

  def test_can_deal_card()
    a_card = @deck.deal_card
    assert_equal(Card, a_card.class())
  end

  def test_first_cards_odered_correctly()
    first_card = @deck.deal_card
    assert_equal('Hearts', first_card.suit())
    assert_equal('Ace', first_card.value())

    first_card = @deck.deal_card
    assert_equal('Hearts', first_card.suit())
    assert_equal('2', first_card.value())

    first_card = @deck.deal_card
    assert_equal('Hearts', first_card.suit())
    assert_equal('3', first_card.value())

    first_card = @deck.deal_card
    assert_equal('Hearts', first_card.suit())
    assert_equal('4', first_card.value())

    first_card = @deck.deal_card
    assert_equal('Hearts', first_card.suit())
    assert_equal('5', first_card.value())
  end

  def test_last_card_equals_king_of_spades()
    51.times do
      @deck.deal_card
    end
    last_card = @deck.deal_card
    assert_equal('Spades', last_card.suit())
    assert_equal('King', last_card.value())
  end

  def test_all_cards_different_at_start()
    used_card_strings = []
    duplicate_found = false
    52.times do
      next_card_string = @deck.deal_card.to_s
      if used_card_strings.include?(next_card_string)
        duplicate_found = true
      else
        used_card_strings.push(next_card_string)
      end
    end

    assert_equal(false, duplicate_found)
  end

  def test_all_cards_different_after_shuffle()
    @deck.shuffle()
    used_card_strings = []
    duplicate_found = false
    52.times do
      next_card_string = @deck.deal_card.to_s
      if used_card_strings.include?(next_card_string)
        duplicate_found = true
      else
        used_card_strings.push(next_card_string)
      end
    end

    assert_equal(false, duplicate_found)
  end

  def test_still_52_cards_after_shuffle()
    @deck.shuffle
    assert_equal(52, @deck.number_of_cards_remaining)
  end

  def test_get_ordered_values()
    expected = ['Ace', '2', '3', '4', '5' , '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
    assert_equal(expected, @deck.get_ordered_values())
  end

  def test_correct_number_of_hands_dealt()
    hands = @deck.deal_hands(3, 4)
    number_of_hands = hands.length
    assert_equal(3, number_of_hands)
  end

  def test_correct_number_of_cards_in_each_dealt_hand()
    @deck.shuffle()
    hands = @deck.deal_hands(3, 4)
    for hand_index in (0..2)
      assert_equal(4, hands[hand_index].number_of_cards)
    end
  end
end
