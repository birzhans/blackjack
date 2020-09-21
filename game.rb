class Game
  atrr_reader :player_name

  def start
    print "Enter your name: "
    self.player_name = gets.chomp
    puts "Hi, #{player_name}, lets start"
  end


  private

  atrr_writer :player_name
