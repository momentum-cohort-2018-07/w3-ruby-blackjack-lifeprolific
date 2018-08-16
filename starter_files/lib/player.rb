require_relative "hand"

class Player

  attr_accessor :hand, :bank

  def initialize(bank)
    @hand = Hand.new
    @bank = bank
  end

end