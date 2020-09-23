# frozen_string_literal: true

require_relative 'player'

class User < Player
  attr_accessor :user_name

  def display
    print "User: #{cash}$ #{points} pts, #{display_cards}"
  end
end
