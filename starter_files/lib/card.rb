class Card

  attr_reader :rank, :suit

  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize(rank, suit)

    if RANKS.include?(rank)
      @rank = rank
    else
      @rank = "invalid rank"
    end

    if SUITS.include?(suit)
      @suit = suit
    else
      @suit = "invalid suit"
    end
  end

  def greater_than?(other_card)
    greater_rank = RANKS.find_index(@rank) > RANKS.find_index(other_card.rank)
    equal_rank = RANKS.find_index(@rank) === RANKS.find_index(other_card.rank)
    greater_suit = SUITS.find_index(@suit) > SUITS.find_index(other_card.suit)
    if greater_rank
      true
    elsif equal_rank && greater_suit
      true
    else
      false
    end
  end

  def ==(other_card)
    (@rank == other_card.rank) && (@suit == other_card.suit)
  end
end