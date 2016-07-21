require "./lib/computer_board"
require "./lib/computer_moves"
require "./lib/player_board"
require "./lib/grids"
require "./lib/ships"

class Game


  LETTER = [*"a".."d"]

  attr_accessor :computer_board, :player_board, :computer_moves, :grids

  def initialize(player = "Player 1", player_board = PlayerBoard.new, computer_board = ComputerBoard.new)
    @player = player
    @grids = Grids.new
    @player_board = player_board
    @computer_board = computer_board
    @computer_moves = ComputerMoves.new.moves_to_play
  end

  def computer_attack
    move_to_play = computer_moves.sample
    computer_moves.delete(move_to_play)
    move_to_play
  end

  def computer_make_move
    pos = []

    computer_attack.split.each do |space|
      pos.unshift(space[1].to_i - 1)
      pos.unshift(space[0].downcase.ord - 97)
    end
    player_board.attack(pos)
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
    computer_board.attack(pos)
  end

  def get_ships_from_user
    grids.computer_message_lay_small_ship
    ship_coords_one = STDIN.gets.chomp
    player_board.grab_coords(ship_coords_one)
    grids.computer_message_lay_big_ship
    ship_coords_two = STDIN.gets.chomp
    player_board.grab_coords(ship_coords_two)
  end

  def play
    get_ships_from_user
    computer_board.render
    player_board.render
    until won? || computer_won?
      make_move
      sleep(1)
      puts "Computer is playing, ya better be ready"
      computer_make_move
      sleep(3)
      system("clear")
      computer_board.render
      player_board.render
    end
  end

  def valid_move?(pos)
    return true if LETTER.include?(pos[0].downcase) && (pos[1].to_i.between?(1, 4))
    false
  end

  def won?
    computer_board.board_grid.map do |row|
      return false if row.include?(:Ship)
    end
    puts "Congratulations, you won! Wow!!"
    true
  end

  def computer_won?
    player_board.board_grid.map do |row|
      return false if row.include?(:Ship)
    end
    puts "Too bad, computer won, play again...."
    true
  end

end
