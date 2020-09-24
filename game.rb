# frozen_string_literal: true
require_relative 'interface'
require_relative 'user'
require_relative 'dealer'

class Game
  BET = 10
  MAX_POINTS = 21

  attr_reader :interface

  def initialize
    @interface = Interface.new
    @user = User.new
    @dealer = Dealer.new
    @user_continue = true
  end

  def play
    interface.hello
    first_bet
    moves
  end

  private

  attr_accessor :user_continue
  attr_reader :user, :dealer

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
      break if no_cash?
      interface.display_game(user, dealer)

      move = interface.user_move(can_add?)
      next_move = send(move)

      dealer_move if next_move.eql?(:dealer_move)
      break if next_move.eql?(:open_cards)

      open_cards if both_three?
      break unless user_continue

      first_bet if user_continue
    end
  end

  def add_card
    user.get_card(dealer.draw_card)
    interface.display_game(user, dealer)
    :dealer_move
  end

  def dealer_move
    dealer.get_card(dealer.draw_card) if dealer.points < 17 && dealer.num_of_cards < 3
    print '(Dealer move) '
    interface.display_game(user, dealer)
  end

  def open_cards
    interface.display_game(user, dealer, true)
    winner
    play_again?
  end

  def winner
    if tie?
      interface.tie
      user.change_balance(BET)
      dealer.change_balance(BET)
    end

    winner = over_points
    winner = check_winner if winner.nil?
    if winner.eql?(user)
      interface.user_won
      user.change_balance(2 * BET)
    else
      interface.user_lost
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
    interface.no_money unless user.cash.positive?
    dealer.change_balance(100) unless dealer.cash.positive?
    play_again?
  end

  def play_again?
    interface.ask_to_play
    choice = gets.chomp
    if choice.eql?('y')
      self.user_continue = true
      user.change_balance(100) unless user.cash.positive?
    else
      self.user_continue = false
    end
  end
end
