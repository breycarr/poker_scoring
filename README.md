# Grabyo technical test

At Grabyo we love board games and will have an occasional poker night.
Since no one remembers the card ranking you will have to write a program that
compare poker hands and determines a winner.

## 1. Requirements

A poker hand has a constructor that accepts a string containing 5 cards: 

```ruby
hand = PokerHand.new("KS 2H 5C JD TD")
```

and a method to compare itself to another hand

```ruby
def compare_with(hand)
  # Your code here
  return 0
end
```

The characteristics of the string of cards are:
*   A space is used as card seperator
*   Each card consists of two characters
*   The first character is the value of the card, valid characters are: `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `T`(en), `J`(ack), `Q`(ueen), `K`(ing), `A`(ce)
*   The second character represents the suit, valid characters are: `S`(pades), `H`(earts), `D`(iamonds), `C`(lubs)

The result of your poker hand compare can be one of the 3 options:
* 0 for a TIE
* 1 for a WIN
* 2 for a LOSS

The ranking of the hands should follow the [Texas Hold'em rules](http://freepokerhoney.com/website_images/8245/poker-strategy/poker-hand-rankings.png)

You are free to architect your code the way you want: adding classes, enums or constants as long as you stick to the `compare_with` method signature and `PokerHand` specification given in the sample. You can use any libraries that you feel are relevant to solve this problem.

## 2. Tests

Sample unit tests have been included in the code skeleton. You can run them as a script: `ruby tests.rb`. Writing more tests is welcome :)


Good luck ;)
