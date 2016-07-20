require "./lib/computer_board"
require "./lib/player_board"
require "./lib/ships"

class Game


  LETTER = [*"a".."d"]

  attr_accessor :computer_board, :player_board

  def initialize(player = "Player 1", player_board = PlayerBoard.new, computer_board = ComputerBoard.new)
    @player = player
    @player_board = player_board
    @computer_board = computer_board
  end

  def make_move
    puts  "Please provide attack position, example (A1)"
    attack_input = gets.chomp.split(//, 2)
    return "Invalid move" unless valid_move?(attack_input)

    pos = []
    attack_input.each do |space|
      if LETTER.include?(space.downcase)
        pos << (space.downcase.ord - 97)
      else
        pos << space.to_i - 1
      end
    end
    hit = computer_board.attack(pos)
  end

  def play
    computer_board.render
    player_board.render
    until won?
      make_move
      sleep(1)
      system("clear")
      computer_board.render
      player_board.render
    end
    puts "Congrats! You sunk all the enea1my ships"
  end

  def valid_move?(pos)
    return true if LETTER.include?(pos[0].downcase) && (pos[1].to_i.between?(1, 4))
    false
  end

  def won?
    computer_board.board_grid.map do |row|
      return false if row.include?(:S)
    end
    true
  end

end
