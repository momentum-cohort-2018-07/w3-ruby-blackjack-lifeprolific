require_relative "hand"

class Dealer

  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

end