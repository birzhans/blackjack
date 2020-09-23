# frozen_string_literal: true

require_relative 'card'
require_relative 'constants'

class Deck
  def initialize
    @log = []
    RANKS.keys.each do |rank|
      SUITS.each do |suit|
        temp_card = Card.new(rank, RANKS[rank], suit)
        log.append(temp_card)
      end
    end
  end

  def shuffle_cards
    log.shuffle!
  end

  def take_card
    log.pop
  end

  def left
    log.size
  end

  private

  attr_reader :log
end
