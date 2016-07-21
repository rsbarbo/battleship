require "pry"
require "./lib/ships"

class ComputerBoard
  attr_reader :board_grid, :ships

  def self.default_board

    Array.new(4) { Array.new(4) {nil} }
  end

  def initialize(board = ComputerBoard.default_board)
    @board_grid = board
    @ships = Ships.create_ships
    rand_populate_board
  end

  def attack(position)
    if valid_move?(position)
      if self[position] == :Ship
        self[position] = :H
        puts "Congrats, it is a hit!"
      else
        self[position] = :M
        puts "Sorry, you have missed..."
      end
    else
      puts "You already fired there... Please try again"
    end
  end

  def valid_move?(position)
    return true if self[position] == nil || self[position] == :Ship
    false
  end

  def render
    print "     COMPUTER'S BOARD\n"
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

  protected

  def rand_populate_board
    @ships.each do |boat|
      placed = false

      until placed
        start = [rand(@board_grid.length), rand(@board_grid[0].length)]
        dir = Ships::DIRECTIONS.sample
        next unless valid_ship_placed?(start, dir, boat.length)
        placed_ship(start, dir, boat.length)
        placed = true
      end
    end
  end

  def placed_ship(start, dir, length)
    i = 0
    while i < length
      self[[start[0] + (dir[0] * i), start[1] + (dir[1] * i)]] = :Ship
      i += 1
    end
  end

  def valid_ship_placed?(start, dir, ship_length)
    i = 0
    x, y = @board_grid.length - 1, @board_grid[0].length - 1
    while i < ship_length
      return false unless (start[0] + (dir[0] * i)).between?(0, x) &&
      (start[1] + (dir[1] * i)).between?(0, y) &&
      self[[start[0] + (dir[0] * i), start[1] + (dir[1] * i)]].nil?
      i += 1
    end
    true
  end

  def [](pos)
    x, y = *pos
    @board_grid[x][y]
  end

  def []=(pos, mark)
    x, y = *pos
    @board_grid[x][y] = mark
  end


end
