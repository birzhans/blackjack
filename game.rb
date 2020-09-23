# frozen_string_literal: true

require_relative 'user'
require_relative 'dealer'

class Game
  BET = 10
  MAX_POINTS = 21
  OPTIONS = {
    '1': :dealer_move, '2': :open_cards, '3': :add_card
  }.freeze

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @user_continue = true
  end

  def play
    user_name
    first_bet
    moves
  end

  private

  attr_accessor :user_continue
  attr_reader :user, :dealer

  def user_name
    print 'Enter your name: '
    user_name = gets.chomp
    puts "Hello, #{user_name}!"
  end

  def reset
    dealer.new_deck
    user.reset
    dealer.reset
    user.change_balance(-BET)
    dealer.change_balance(-BET)
  end

  def first_bet
    reset
    2.times do
      user.get_card(dealer.draw_card)
      dealer.get_card(dealer.draw_card)
    end
  end

  def moves
    loop do
      display_game
      break if no_cash?

      move = user_move(can_add?)
      next_move = send(move)

      dealer_move if next_move.eql?(:dealer_move)
      break if next_move.eql?(:open_cards)

      open_cards if both_three?
      break unless user_continue

      first_bet if user_continue
    end
  end

  def display_game(dealer_show = false)
    puts "#{user.display}  |  #{dealer.display(dealer_show)}"
  end

  def user_move(can_add)
    puts '1 -> skip'
    puts '2 -> open cards'
    puts '3 -> add card' if can_add
    move = BET
    move = gets.chomp.to_sym until OPTIONS.keys.include?(move) || (move.eql?('3') && !can_add)
    OPTIONS[move]
  end

  def add_card
    user.get_card(dealer.draw_card)
    display_game
    :dealer_move
  end

  def dealer_move
    dealer.get_card(dealer.draw_card) if dealer.points < 17 && dealer.num_of_cards < 3
    print '(Dealer move) '
    display_game
  end

  def open_cards
    display_game(true)
    winner
    play_again?
  end

  def winner
    if tie?
      puts "It's a tie!"
      user.change_balance(BET)
      dealer.change_balance(BET)
    end

    winner = over_points
    winner = check_winner if winner.nil?
    if winner.eql?(user)
      puts 'You won!'
      user.change_balance(2 * BET)
    else
      puts 'You lost'
      dealer.change_balance(2 * BET)
    end
  end

  def over_points
    if user.points > MAX_POINTS && dealer.points <= MAX_POINTS
      dealer
    elsif dealer.points > MAX_POINTS && user.points <= MAX_POINTS
      user
    end
  end

  def check_winner
    if user.points > dealer.points
      user
    elsif dealer.points > user.points
      dealer
    end
  end

  def tie?
    user.points.eql?(dealer.points)
  end

  def can_add?
    user.num_of_cards < 3
  end

  def both_three?
    dealer.num_of_cards + user.num_of_cards == 6
  end

  def no_cash?
    var = !user.cash.positive? || !dealer.cash.positive?
    bankrupt if var
    var
  end

  def bankrupt
    puts 'You have no money!' unless user.cash.positive?
    dealer.change_balance(100) unless dealer.cash.positive?
    play_again?
  end

  def play_again?
    puts 'Do you want to play again? (y/n)'
    choice = gets.chomp
    if choice.eql?('y')
      self.user_continue = true
      user.change_balance(100) unless user.cash.positive?
    else
      self.user_continue = false
    end
  end
end
