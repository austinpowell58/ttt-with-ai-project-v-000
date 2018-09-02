
class Game
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def one_player
    puts "Who should go first? Computer or Human"
    starter = gets.strip
    if starter == "Computer"
      new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      new_game.play
    else if starter == "Player"
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      new_game.play
    else
      put "Please select: Computer or Human"
      starter = gets.strip
    end
  end 

  
  def self.create
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? (0 , 1 , 2)"
    player_count = gets.to_i
    if player_count == 0 
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"),Board.new)
      new_game.play
    elsif player_count == 2
      new_game = Game.new
      new_game.play 
    elsif player_count == 1 
      one_player
    else
      puts "Select: '0' , '1' , or '2'"
      player_count = gets.to_i
    end
  end 
  
    
  

  def initialize(player_1= Players::Human.new("X") ,player_2= Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end 
  
  def won?
    win = false 
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all?{|win_index| @board.cells[win_index] == @player_1.token}
        win = win_combo
        return win
      elsif win_combo.all? {|win_index| @board.cells[win_index] == @player_2.token}
        win = win_combo
        return win 
      end 
    end 
    win 
  end 
  
  
  def draw?
    won? == false && @board.cells.all? {|index| index == @player_1.token || index == @player_2.token}
  end 
  
  def over?
    draw? || won?
  end 
  
  def winner
    if won? == false
      nil
    elsif won?.all?{|x| @board.cells[x] == @player_1.token}
      winner = @player_1.token
    elsif won?.all?{|x| @board.cells[x] == @player_2.token}
      winner = @player_2.token
    end 
  end 
  
  def turn
    player = current_player
    puts "Please enter 1-9:"
    index = player.move(@board)
    if @board.valid_move?(index)
      @board.update(index, player)
    else
      puts "Please enter 1-9:"
      index = player.move(@board)
    end 
  end
  
  def play()
  until over?() do
    turn()
  end 
    if won?()
      champion = winner()
      puts "Congratulations #{champion}!"
    else if draw?()
      puts "Cat's Game!"
    end  
  end 
end 
    
    

  


