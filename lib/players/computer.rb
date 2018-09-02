require "pry"
module Players

  class Computer < Player
    
  
        
    def move(input)
      @board = input
      answer = [*1..9].sample
      if !@board.taken?(answer)
        answer.to_s
      else
        answer = [*1..9].sample
      end
    end 
      
  
  end 
end