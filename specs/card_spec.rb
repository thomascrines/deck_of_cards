require('minitest/autorun')
require('minitest/rg')
require_relative('../card')

class TestCard < MiniTest::Test

  def setup
    @card_3_of_clubs = Card.new('3', 'Clubs')
    @card_ace_of_diamonds = Card.new('Ace', 'Diamonds')
  end

  def test_3_of_clubs_value_is_3()
    assert_equal('3', @card_3_of_clubs.value())
  end

  def test_3_of_clubs_suit_is_clubs()
    assert_equal('Clubs', @card_3_of_clubs.suit())
  end

  def test_card_to_s()
    assert_equal('3 of Clubs', @card_3_of_clubs.to_s())
  end

end
