class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n) }
  end

  def populate
  end

  def render
    @grid.each do |row|
      puts row
    end
  end

  def won?
  end

  def reveal
  end
end
