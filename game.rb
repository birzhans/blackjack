class Game
  attr_reader :player_name

  def start
    ask_name
  end


  private

  def ask_name
    print "Enter your name: "
    self.player_name = gets.chomp
    puts "Hi, #{player_name}, lets start"
  end

  attr_writer :player_name
end
