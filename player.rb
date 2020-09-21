require_relative 'card'

class Player
  attr_reader :cash
  attr_accessor :cards

  def initialize
    @cash = 100
    @cards = []
  end

  def get_card
    card = Card.new
    self.cards.append(card)
  end

  def print_cards
    cards.each { |card| print "#{card.card_name } "}
  end

  protected

  attr_writer :cash
end
