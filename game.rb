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
    print_cards
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

  def print_cards
    self.user.print_cards
    print "     "
    self.dealer.print_cards
  end

  attr_writer :player_name
end
