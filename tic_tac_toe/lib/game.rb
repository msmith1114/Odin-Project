require_relative 'board'
require_relative 'player'


class Game
  @@WINNING_ARRAY = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player1, :player2

  def initialize(player1,player2)
    @board = Board.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
  end



  def victory?(player)
    @@WINNING_ARRAY.each {|set|
      if (set-player.positions).empty?
        return true
      end
    }
    return false
  end

  def input_move
    puts "Pick a Move: Positions 0-8"
    @board.display_board
    move = gets.chomp.to_i
    until move.between?(0,8)
      puts "Please pick a position between 0-8"
      @board.display_board
      move = gets.chomp.to_i
    end
    move
  end


  def player_move(player,space)
    @board.board[space] = player.type
    player.positions << space.to_i
  end



end
