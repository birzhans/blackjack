# frozen_string_literal: true

require_relative 'constants'

class Card
  attr_reader :rank, :value, :suit

  def initialize(rank, value, suit)
    @rank = rank
    @value = value
    @suit = suit
  end

  def to_s
    rank + suit
  end

  def same?(card)
    rank.eql?(card.rank) && suit.eql?(card.suit)
  end
end
