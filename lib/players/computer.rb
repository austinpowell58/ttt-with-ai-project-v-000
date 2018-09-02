require "pry"
module Players
  class Computer < Player
    
    def valid_moves
      array = []
      @board.cells.each do |value|
        if value == " "
          array << @board.cells.index[value]
        end 
      end 
      binding.pry
    end
        
    
    def move(input)
      @board = input
    end 
    
  end 
end