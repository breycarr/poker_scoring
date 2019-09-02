class Card

  VALUES = {
    "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14
  }

  attr_reader :rank, :suit

  def initialize(name)
    @rank = name.split("")[0]
    @suit = name.split("")[1]
  end

  def value
    VALUES.has_key?(@rank) ? VALUES[@rank] : @rank.to_i 
  end
end


class PokerHand
  
  attr_reader :cards

  def initialize(cards)
    @cards = cards.split(" ").map{ |card| Card.new(card) }
    @ranks = @cards.map { |card| card.rank }
    @suits = @cards.map { |card| card.suit }
  end

  def compare_with(hand)
    return 0
  end

  private 
  
  def royal_flush?
    self.straight_flush? && @ranks.all?{ /TJQKA/ }
  end
  
  def straight_flush?
    self.straight? && self.flush?
  end

  def four_kind?
    !@ranks.select{ |x| @ranks.count(x) == 4 }.empty?
  end

  def full_house?
    self.pair? && self.three_kind? 
  end

  def flush?
    !@suits.select{ |x| @suits.count(x) == 5 }.empty? 
  end

  def straight?
    values = @cards.map{ |x| x.value }
    values.sort.each_cons(2).all? { |x,y| y == x + 1 } 
  end

  def three_kind?
    !@ranks.select{ |x| @ranks.count(x) == 3 }.empty? 
  end

  def two_pair?
    @ranks.select{ |x| @ranks.count(x) == 2 }.length == 4 
  end 

  def pair?
    !@ranks.select{ |x| @ranks.count(x) == 2 }.empty? 
  end

  # high_card

end
