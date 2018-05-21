
require_relative 'game'


puts "Welcome to Tic Tac Toe....."
sleep(2)
puts "Player 1, would you like to be X or O?"
player1 = gets.chomp.upcase
until player1 == 'X' or player1 == 'O' do
  puts "Please enter X or O..."
  player1 = gets.chomp.upcase
end

if player1 == 'X'
  game = Game.new('X','O')
  player2 = 'O'
else
  game = Game.new('O','X')
  player2 = 'X'
end


turn = 2
until game.board.board_full? do
  if turn % 2 == 0
    move = game.input_move
    until game.board.space_empty?(move)
      puts "That space is full...pick another space"
      move = game.input_move
    end
    game.player_move(game.player1,move)
    if game.victory?(game.player1)
      puts "Player 1 Wins!!"
      break
    end
  else
    move = game.input_move
    until game.board.space_empty?(move)
      puts "That space is full...pick another space"
      move = game.input_move
    end
    game.player_move(game.player2,move)
    if game.victory?(game.player2)
      puts "Player 2 Wins!!"
      break
    end
  end
turn +=1
end
game.board.display_board
