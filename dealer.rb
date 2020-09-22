require_relative 'player'

class Dealer < Player
  def print_cards
    self.cards.size.times { print '* ' }
  end
end
