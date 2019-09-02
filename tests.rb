require_relative "lib/poker"
require "test/unit"

class TestCase < Test::Unit::TestCase

  def test_higher_pair_wins
    hand = PokerHand.new("TD 9S QS AH TH")
    opponent = PokerHand.new("5D 5S QC 9H AD")

    assert_equal(1, hand.compare_with(opponent), "You win")
  end
end