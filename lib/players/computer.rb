require "pry"
module Players

  class Computer < Player
    
<<<<<<< HEAD
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
      
=======
    def empty? 
      !@board.cells.taken?
    end 
        
    def move(input)
      @board = input 
      binding.pry
>>>>>>> 6471325bc62334a6ba546ee4e81a8473c1799c9e
    end 
      
  
  end 
end