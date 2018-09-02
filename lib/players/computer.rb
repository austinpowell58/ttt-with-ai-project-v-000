require "pry"
module Players

  class Computer < Player
    
    def corner
      ["1", "3","7", "9"].find{|a| @board.taken?(a)} 
    end 
    
        
    def move(input)
      @board = input
      answer = [*1..9].sample
      if !@board.taken?("5")
        "5"
      elsif corner
        corner
      else
        answer = [*1..9].sample
      end
      
    end 
      
  
  end 
end