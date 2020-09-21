class Card

  attr_reader :card_name

  RANKS = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
    '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
    'Q' => 10, 'K' => 10, 'A' => 1
  }

  SUITS = ['+', '<3', '^', '<>']

  def initialize
    @card_rank = random_rank
    @card_suit = SUITS[rand(SUITS.size)]
    @card_name = @card_rank + @card_suit
  end

  private

  def random_rank
    ranks_keys = RANKS.keys
    ranks_keys[rand(ranks_keys.size)]
  end
end
