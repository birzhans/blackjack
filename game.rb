require_relative 'user'
require_relative 'dealer'

class Game
  attr_reader :player_name, :user, :dealer
  attr_accessor :move

  def initialize
    @user = User.new
    @dealer = Dealer.new
  end

  def start
    ask_name
    card_draw(2)
    bet
    display_moves
    process_move
  end


  private

  def ask_name
    print "Enter your name: "
    self.player_name = gets.chomp
    puts "Hi, #{player_name}, lets start"
  end

  def card_draw(n)
    n.times do
      self.user.get_card
      self.dealer.get_card
    end
    display_game
  end

  def display_game(show_dealer = false)
    self.user.print_cards
    print " | "
    self.dealer.print_cards(show_dealer)
    puts
  end

  def display_moves
    puts '1 -> skip'
    puts '2 -> open cards'
    puts '3 -> add card' if user_num_of_cards.eql?(2)
    get_move
  end

  def bet
    self.user.cash -= 10
    self.dealer.cash -= 10
  end

  def user_num_of_cards
    self.user.cards.size
  end

  def get_move
    begin
      move = gets.chomp.to_i
      raise "Invalid input." if move > 3 || move < 1
      raise "Invalid input." if move.eql?(3) && user_num_of_cards > 2
    rescue
      retry
    end
    self.move = move
  end

  def process_move
    dealer_move if self.move.eql?(1)
    display_game(true) if self.move.eql?(2)
    card_draw(1) if self.move.eql?(3)
  end

  attr_writer :player_name
end
