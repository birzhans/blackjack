class Player
  attr_reader :cash

  def initialize
    @cash = 100
  end

  protected

  attr_writer :cash
end
