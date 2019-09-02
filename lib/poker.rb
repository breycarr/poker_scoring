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
    @values = @cards.map{ |card| card.value }
    @suits = @cards.map { |card| card.suit }
  end

  def compare_with(opponent)
    player_hand = self.score_hand
    opponent_hand = opponent.score_hand
    if player_hand > opponent_hand
      1
    elsif player_hand < opponent_hand
      2
    elsif player_hand == opponent_hand
      if tie_break(opponent) != 0
        tie_break(opponent)
      else 
        high_card(opponent)
      end
    end
  end

  def score_hand
    case 
    when self.straight_flush? then 8
    when self.four_kind? then 7
    when self.full_house? then 6
    when self.flush? then 5
    when self.straight? then 4
    when self.three_kind? then 3
    when self.two_pair? then 2
    when self.pair? then 1
    else 0
    end
  end 
  
  def straight_flush?
    self.straight? && self.flush?
  end

  def four_kind?
    !@values.select{ |x| @values.count(x) == 4 }.empty?
  end

  def full_house?
    self.pair? && self.three_kind? 
  end

  def flush?
    !@suits.select{ |x| @suits.count(x) == 5 }.empty? 
  end

  def straight?
    @values.sort.each_cons(2).all? { |x,y| y == x + 1 } 
  end

  def three_kind?
    !@values.select{ |x| @values.count(x) == 3 }.empty? 
  end

  def two_pair?
    @values.select{ |x| @values.count(x) == 2 }.length == 4 
  end 

  def pair?
    !@values.select{ |x| @values.count(x) == 2 }.empty? 
  end

  def high_card(opponent)
    player_card = @cards.sort { |a, b| a.value <=> b.value }.pop
    opponent_card = opponent.cards.sort { |a, b| a.value <=> b.value }.pop
    
    give_points(player_card.value, opponent_card.value)
  end

  def tie_break(opponent)
    player_hand = @values.select{ |x| @values.count(x) == 2 }.pop
    vs = opponent.cards.map { |card| card.value }
    opponent_hand = vs.select{ |x| vs.count(x) == 2 }.pop 
    
    give_points(player_hand, opponent_hand)
  end

  private

  def give_points(player, opponent)
    case
    when player > opponent then 1
    when player < opponent then 2
    else 0
    end
  end
end
