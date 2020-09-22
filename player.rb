require_relative 'card'

class Player
  attr_accessor :cards, :points, :cash, :points

  def initialize
    @cash = 100
    @cards = []
    @points = 0
  end

  def get_card
    card = Card.new
    self.cards.append(card)
    #validate
    calculate_point(card)
  end

  def calculate_point(card)
    if card.card_rank.eql?('A')
      if self.points < 11
        self.points += 11
      else
        self.points += 1
      end
    else
      self.points += card.card_value
    end
  end
end
