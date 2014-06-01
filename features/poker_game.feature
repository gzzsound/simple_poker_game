Feature: The Poker Game!

  A poker hand consists of 5 cards dealt from the deck. Poker hands are ranked by the following partial order from lowest to highest.
  High Card: Hand which do not fit any higher category are ranked by the value of their highest card. If the highest cards have the same value, the hands are ranked by the next highest, and so on.
  Pair: 2 of the 5 cards in the hand have the same value. Hand which both contain a pair are ranked by the value of the cards forming the pair. If these values are the same, the hands are ranked by the values of the cards not forming the pair, in decreasing order.
  Two Pairs: The hand contains 2 different pairs. Hand which both contain 2 pairs are ranked by the value of their highest pair. Hand with the same highest pair are ranked by the value of their other pair. If these values are the same the hands are ranked by the value of the remaining card.
  Three of a Kind: Three of the cards in the hand have the same value. Hand which both contain three of a kind are ranked by the value of the 3 cards.
  Straight: Hand contains 5 cards with consecutive values. Hand which both contain a straight are ranked by their highest card.
  Flush: Hand contains 5 cards of the same suit. Hand which are both flushes are ranked using the rules for High Card.
  Full House: 3 cards of the same value, with the remaining 2 cards forming a pair. Ranked by the value of the 3 cards.
  Four of a kind: 4 cards with the same value. Ranked by the value of the 4 cards.
  Straight flush: 5 cards of the same suit with consecutive values. Ranked by the highest card in the hand.

  Scenario Outline: Find the Winner
    Given "<loser_cards>" to "<the_loser>"
    Given "<winner_cards>" to "<the_winner>"
    When the game is over
    Then the winner is the "<the_winner>"
    Then the scoreboard is "<the_winner>", "<the_loser>"


  Examples:
    | loser_cards    | winner_cards   | the_loser  | the_winner |
    | 2C 3C 4C 5C 5C | 3C 4C 5C 6C 7C | The Loser  | The Winner |
    | KS KS QD QS AH | 2D 2C 6C AH AH | The Loser  | The Winner |
    | JD JC TS JS QD | 3S 3H 9S 3D 9D | The Loser  | The Winner |
    | 9S TC JC QH KH | KD 8D 7D 3D 2D | The Loser  | The Winner |
    | KS JS JD QD KC | 2D 7D 2D 2C 7D | The Loser  | The Winner |
    | TH JH 5H 6H 7H | JD 2D 3D 8D TD | The Loser  | The Winner |
    | 5S 6S 7S 8H 9S | 3H 4H 5H 6H 7H | The Loser  | The Winner |
    | 3D 3C 3S KD AH | 8H 9C TC JD QH | The Loser  | The Winner |