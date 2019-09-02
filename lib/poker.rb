class Card

  attr_reader :rank, :suit

  def initialize(name)
    @rank = name.split("")[0]
    @suit = name.split("")[1]
  end

end

class PokerHand
  
  attr_reader :cards

  def initialize(cards)
    @cards = cards.split(" ").map{ |card| Card.new(card) }
  end

  def pair?
    ranks = @cards.map { |card| card.rank }
    !ranks.select{ |x| ranks.count(x) == 2 }.empty? ? true : false
  end

  def three_kind?
    ranks = @cards.map { |card| card.rank }
    !ranks.select{ |x| ranks.count(x) == 3 }.empty? ? true : false
  end

  def four_kind?
    ranks = @cards.map { |card| card.rank }
    !ranks.select{ |x| ranks.count(x) == 4 }.empty? ? true : false
  end

  def compare_with(hand)
   return 0
  end
end
