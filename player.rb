# frozen_string_literal: true

require_relative 'card'

class Player
  INITIAL_CASH = 100
  BET = 10

  attr_reader :cash, :cards

  def initialize
    @cash = INITIAL_CASH
    @cards = []
  end

  def get_card(card)
    cards.append(card)
  end

  def change_balance(amount)
    self.cash += amount
  end

  def num_of_cards
    cards.size
  end

  def points
    points = 0
    cards.each { |c| points += c.value }
    points -= 10 if points > 21 && aces?
    points
  end

  def aces?
    cards.any? { |c| c.rank.eql?('A') }
  end

  def reset
    self.cards = []
  end

  def display_cards
    cards.map { |card| "#{card.rank}#{card.suit}" }.join(' ')
  end

  private

  attr_writer :cards, :cash
end
