require_relative "card"

class Deck

  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize

    @cards = []

    SUITS.each do |suit|
      RANKS.each {|rank| @cards << Card.new(rank, suit)}
    end

  end

  def cards_left
    @cards.length
  end

  def draw
    @cards.shift
  end

  def shuffle
    prg = Random.new
    split_index = 1
    last_index = @cards.length - 1
    (0..last_index).each do |current_index|
      current_card = @cards[current_index]
      @cards.delete_at(current_index)
      @cards.insert(prg.rand(split_index), current_card)
      split_index += 1
    end
  end
end