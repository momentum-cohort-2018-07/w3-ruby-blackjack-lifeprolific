require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require_relative 'card'

class BlackjackGame

  attr_reader :player

   def initialize
    @player = Player.new(100)
    @deck = Deck.new
   end

   def new_round
    puts "You have $#{@player.bank} and bet $10."
    @player.bank -= 10
    puts "You now have $#{@player.bank}."
    @deck = Deck.new
    @deck.shuffle
    2.times {deal_card(@player)}
   end

   def deal_card(player)
    card = @deck.draw
    player.hand.add_card(card)
    puts "The house deals you the #{card}."
   end
end