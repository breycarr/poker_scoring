# Poker Hand Comparison technical test
> Since no one remembers the card ranking you will have to write a program that compares poker hands and determines a winner.

## Requirements

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

## Installation

Clone this repository and navigate to the relevant folder

Run the following command to start:

```
$ irb -r ./lib/poker.rb  
```

## Usage

A poker hand has a constructor that accepts a string containing 5 cards: 

```ruby
hand = PokerHand.new("KS 2H 5C JD TD")
```
and a method to compare itself to another hand
```ruby
hand.compare_with(opponent)
```

This will output a score, as stated above, based on which hand is better. If both players have the same kind of hand, the method will then see who has the higher version of that hand. For example the high pair in a pair hand. If the same high pair is present, the winner will be determined by the high card, if the high card is the same, there will be a draw.