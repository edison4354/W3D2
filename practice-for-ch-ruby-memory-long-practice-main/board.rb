class Board
  attr_reader :grid, :n
  def initialize(n)
    @n = n
    @grid = Array.new(n) { Array.new(n) }
  end

  def populate
    alpha="QWERTYUIOPASDFGHJKLZXCVBNM"
    idx = (@n*@n)/2 
    pairs = alpha[0...idx]
    pairs *=2
    shuffled_pairs = pairs.split("").shuffle
    count=0
    @grid.each.with_index do |row, i|
      row.each.with_index do |col, j|
        @grid[i][j] = shuffled_pairs[count]
        count+=1
      end
    end
    @grid
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
