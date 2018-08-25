class Card

  include Comparable

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

  def <=>(other)
    comparison = RANKS.find_index(@rank) <=> RANKS.find_index(other.rank)
    if comparison == 0
      return SUITS.find_index(@rank) <=> SUITS.find_index(other.rank)
    else
      return comparison
    end
  end

  def inspect
    @rank.to_s + " of " + @suit.to_s
  end

  def to_s
    @rank.to_s + " of " + @suit.to_s
  end
end