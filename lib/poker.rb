class Card

  attr_reader :value, :suit

  def initialize(name)
    @value = name.split("")[0]
    @suit = name.split("")[1]
  end

end

class PokerHand
  
  attr_reader :cards

  def initialize(cards)
    @cards = cards.split(" ").map{ |card| Card.new(card) }
  end

  def pair?
    values = @cards.map { |card| card.value }.sort
    # Count how many of the same value exist
    if !values.select{ |x| values.count(x) > 1}.empty?
      true
    else
      false
    end
  end

  def compare_with(hand)
   return 0
  end
end
