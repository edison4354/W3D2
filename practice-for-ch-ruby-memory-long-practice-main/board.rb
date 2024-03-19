require_relative 'card.rb'

class Board
  attr_reader :grid, :n
  def initialize(n=4)
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
        @grid[i][j] = Card.new(shuffled_pairs[count])
        @grid[i][j].hide
        count+=1
      end
    end
    @grid
  end

  def render
    @grid.each do |row|
      row.each do |col|
        if !col.side_up
          print '_'
          print ' '
        else
          print col
          print ' '
        end
      end
      puts
    end
  end

  def won?
    @grid.flatten.all? { |card| card.side_up }
  end

  def reveal(pos)
    row, col = pos
    @grid[row][col].reveal
  end

  def cheat
    @grid.each do |row|
      row.each do |col|
        if col.side_up
          print '_'
          print ' '
        else
          print col
          print ' '
        end
      end
      puts
    end
  end
end