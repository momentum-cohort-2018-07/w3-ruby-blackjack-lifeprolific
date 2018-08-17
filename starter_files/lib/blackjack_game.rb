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
    @player.hand.clear
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

  def play_hand
    player_turn
    house_turn
  end

  def player_turn
    bust = false
    hit = true
    # loop until stay or bust
    while (hit && !bust)
      puts "Your current hand: #{@player.hand}."
      puts "Your hand's value: #{player.hand.valid_values}"
      hit = check_hit
      if hit
        deal_card(player)
      end
      bust = player.hand.valid_values.length == 0
      if bust
        puts "You bust!"
      end
    end
  end

  def house_turn
    puts "house_turn"
  end

  def check_hit
    # loop until you get a good answer and return
    while true
      puts "Please enter (h)it or (s)tay:"
      answer = gets.chomp.downcase
      if answer[0] == "h"
        return true
      elsif answer[0] == "s"
        return false
      end
      puts "That is not a valid answer!"
    end
  end
end