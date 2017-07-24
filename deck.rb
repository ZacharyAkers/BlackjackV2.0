class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    Suits.each do |suit|
      Ranks.each do |rank| 
        @cards << Card.new(rank, suit)
      end
    end
  end
  def remaining
    @cards.length
  end
  def draw
    @cards.shift
  end
  def shuffle!
    @cards.shuffle!
  end
end