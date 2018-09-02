require "pry"
class Board
  
  attr_accessor :cells
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(index)
    input = index.to_i - 1
    @cells[input]
  end 
  
  def full?
    @cells.all? {|a| a == "X" || a == "O"}
  end 
  
  def turn_count
    count = @cells.select{|a| a == "X" || a == "O"}
    count.size
  end
  
  def taken?(index)
    position(index) != " "
  end
  
  def valid_move?(index)
    index.to_i.between?(1, 9) && taken?(index.to_i) == false
  end 
  
  def update(index, player)
    position = index.to_i - 1
    @cells[position] = player.token
    @cells[position]
  end 
  
  
  
end 