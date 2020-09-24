class Interface
  OPTIONS = {
    '1': :dealer_move, '2': :open_cards, '3': :add_card
  }.freeze

  def hello
    puts "Welcome to the blackjack game."
    user_name
  end

  def user_name
    print 'Enter your name: '
    user_name = gets.chomp
    puts "Hello, #{user_name}!"
  end

  def display_game(user, dealer, dealer_show = false)
    puts "#{user.display}  |  #{dealer.display(dealer_show)}"
  end

  def user_move(can_add)
    puts '1 -> skip'
    puts '2 -> open cards'
    puts '3 -> add card' if can_add
    move = 0
    move = gets.chomp.to_sym until OPTIONS.keys.include?(move) || (move.eql?('3') && !can_add)
    OPTIONS[move]
  end

  def tie
    puts "It's a tie!"
  end

  def user_won
    puts 'You won!'
  end

  def user_lost
    puts 'You lost'
  end

  def no_money
    puts 'You lost'
  end

  def ask_to_play
    puts 'Do you want to play again? (y/n)'
  end
end
