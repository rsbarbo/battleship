require "pry"
require "./lib/ships"

class PlayerBoard
  attr_reader :board_grid, :ships

  LETTER_KEYS = {"a" => 0, "b" => 1,
                 "c" => 2, "d" => 3}

  NUM_KEYS = {"1" => 0, "2" => 1,
              "3" => 2, "4" => 3}

  def initialize(board = PlayerBoard.default_board)
    @board_grid = board
  end

  def self.default_board
    Array.new(4) { Array.new(4) {nil} }
  end

  def grab_coords(ship_coords)
    coords = ship_coords.downcase.split(" ")
    ship = []
    coords.each do |coord|
      ship << [LETTER_KEYS[coord[0]], NUM_KEYS[coord[1]]]
    end
    insert_ship(ship)
  end

  def insert_ship(ship)
    ship.each do |coord|
      place_ship(coord[0], coord[1])
    end
  end

  def place_ship(x, y)
    board_grid[x][y] = :Ship
  end

  def attack(pos)
    if board_grid[pos[0]][pos[1]] == :Ship
      board_grid[pos[0]][pos[1]] = :H
      puts "UH OH, COMPUTER GOT YA! IT'S A HIT!"
    else
      board_grid[pos[0]][pos[1]] = :M
      puts "LOL, COMPUTER MISSED"
    end
  end

  def render
    print " **********************\n"
    print "        YOUR BOARD    \n"
    print "     1    2    3    4\n"
    print "   ___________________\n"
    @board_grid.each_with_index do |row, row_num|
      row.each_with_index do |square, col|
        if col == 0
          print "#{(row_num + 97).chr.upcase} | "
        end

        if square.nil? || square == :Ship
          print "[ ]  "
        else
          print "[#{square}]  "
        end
      end
      puts
    end
  end
end
