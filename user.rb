require_relative 'player'

class User < Player
  def print_cards
    print 'You: '
    cards.each { |card| print "#{card.card_name } "}
    print "pts: #{self.points}"
  end
end
