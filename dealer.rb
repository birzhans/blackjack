require_relative 'player'

class Dealer < Player
  def print_cards(show = false)
    print 'Dealer: '
    if show
      cards.each { |card| print "#{card.card_name } "}
      print "pts: #{self.points}"
    else
      self.cards.size.times { print '* ' }
    end
  end
end
