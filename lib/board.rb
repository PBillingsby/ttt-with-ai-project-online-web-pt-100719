require 'pry'
class Board
  attr_accessor :cells

  @cells = []
  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(index_input)
    self.cells[index_input.to_i - 1]
  end

  def full?
    self.cells.all? {|index| index == "O" || index == "X"}
  end

  def turn_count
    self.cells.select {|cell| cell == "X" || cell == "O"}.count
  end

  def taken?(index)
    self.cells[index.to_i - 1] == "X" || self.cells[index.to_i - 1] == "O"
  end

  def valid_move?(input)
    if input.length == 1
      index = input.to_i
      index.between?(0, 9) && !taken?(index)
    else
      false
    end
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
  
end