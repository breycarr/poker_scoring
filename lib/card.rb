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