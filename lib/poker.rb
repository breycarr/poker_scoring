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
    values = @cards.map { |card| card.value }
    !values.select{ |x| values.count(x) == 2 }.empty? ? true : false
  end

  def three_kind?
    values = @cards.map { |card| card.value }
    !values.select{ |x| values.count(x) == 3 }.empty? ? true : false
  end

  def compare_with(hand)
   return 0
  end
end
