require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require_relative 'card'
require_relative 'dealer'

class BlackjackGame

  attr_reader :player

  def initialize
    @player = Player.new(100)
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def new_round
    @player.hand.clear
    @dealer.hand.clear
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
    house_setup
    ## review
    if player_turn
      house_turn
      resolve_hands
    end
  end

  def house_setup
    card = @deck.draw
    @dealer.hand.add_card(card)
    puts "the house deals itself the #{card}"
    @dealer.hand.add_card(@deck.draw)
    puts "the house deals itself a card face-down"
  end

  def player_turn
    bust = false
    hit = true
    # loop until stay or bust
    while (hit && !bust)
      puts "Your current hand: #{@player.hand}."
      puts "Your hand's value: #{@player.hand.valid_values}"
      puts "The house's current hand: #{@dealer.hand.cards[0]}, face-down card"
      hit = check_hit
      if hit
        deal_card(@player)
      end
      bust = @player.hand.valid_values.length == 0
      if bust
        puts "You bust!"
      end
    end
    !bust
  end

  def house_turn
    bust = false
    stay = !(@dealer.hand.valid_values.max < 17)
    puts "the house's hand: #{@dealer.hand}"
    puts "the house hand's value = #{@dealer.hand.valid_values}"
    # ! A|B
    while (!bust) && (!stay)
      card = @deck.draw
      puts "the house hits, dealing itself the #{card}"
      @dealer.hand.add_card(card)
      puts "the house hand's value = #{@dealer.hand.valid_values}"
      if @dealer.hand.valid_values.length == 0
        bust = true
        puts "The house busts!"
      elsif @dealer.hand.valid_values.max >= 17
        stay = true
      end
    end
    if stay
      puts "The house stays."
    end
  end

  def resolve_hands
    player_score = @player.hand.score
    dealer_score = @dealer.hand.score
    puts "Your hand's value: #{player_score}"
    puts "The house hand's value: #{dealer_score}"
    if player_score == "bust"
      puts "You lose."
    elsif dealer_score == "bust"
      puts "You win $20!"
      @player.bank = @player.bank + 20
    elsif player_score == "blackjack"
      puts "You win $20!"
      @player.bank = @player.bank + 20
    elsif player_score > dealer_score
      puts "You win $20!"
      @player.bank = @player.bank + 20
    else
      puts "You lose."
    end
  end

  def resolve_score(player)
    player_score = player.hand.valid_values
    if player_score.length == 0
      player_score = "bust"
    else
      player_score = player_score.max
    end
    player_score
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