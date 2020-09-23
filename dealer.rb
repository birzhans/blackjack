# frozen_string_literal: true

require_relative 'player'
require_relative 'deck'

class Dealer < Player
  def display(show_cards = false)
    if show_cards
      "Dealer: #{cash}$ #{points} pts, #{display_cards}"
    else
      "Dealer: #{cash}$ __ pts, #{'** ' * num_of_cards}"
    end
  end

  def new_deck
    @deck = Deck.new
    deck.shuffle_cards
  end

  def new_n
    @n = 10
  end

  def draw_card
    deck.take_card
  end

  attr_reader :deck
end
