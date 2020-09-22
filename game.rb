require_relative 'user'
require_relative 'dealer'

class Game
  attr_reader :player_name, :user, :dealer

  def initialize
    @user = User.new
    @dealer = Dealer.new
  end

  def start
    ask_name
    card_draw
    bet
    display_game
    display_moves
  end


  private

  def ask_name
    print "Enter your name: "
    self.player_name = gets.chomp
    puts "Hi, #{player_name}, lets start"
  end

  def card_draw
    2.times do
      self.user.get_card
      self.dealer.get_card
    end
  end

  def display_game
    self.user.print_cards
    print "pts: #{self.user.points}"
    print " | "
    self.dealer.print_cards
    print "pts: #{self.dealer.points}"
  end

  def display_moves
    puts '1 -> skip'
    puts '2 -> open cards'
    puts '3 -> add card' if self.user.cards.size.eql?(2)
  end

  def bet
    self.user.cash -= 10
    self.dealer.cash -= 10
  end

  attr_writer :player_name
end
