require_relative "card"

class Hand

  CARD_VALUES = {
    :A => [1,11],
    2 => [2],
    3 => [3],
    4 => [4],
    5 => [5],
    6 => [6],
    7 => [7],
    8 => [8],
    9 => [9],
    10 => [10],
    :J => [10],
    :Q => [10],
    :K => [10]
  }

  attr_reader :cards

  def initialize
    @cards = []
    @hand_values = [0]
  end

  def clear
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def hand_values
    @hand_values = [0]
    @cards.each do |card|
      buffer_values = []
      CARD_VALUES[card.rank].each do |card_value|
        buffer_values.concat(@hand_values.map{|subtotal| subtotal + card_value})
      end
      @hand_values = buffer_values
    end
    @hand_values
  end

  def valid_values
    hand_values.find_all {|value| value < 22}
  end

  def score
    if valid_values.length == 0
      return "bust"
    elsif @cards.length == 2 && valid_values.max == 21
      return "blackjack"
    else
      return valid_values.max
    end
  end

  def to_s
    @cards.join(', ')
  end
end