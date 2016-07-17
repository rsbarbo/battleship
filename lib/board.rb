require "pry"
require "./lib/ships"

class Board
  attr_reader :board_grid, :ships

  def self.default_board
    Array.new(10) { Array.new(10) {nil} }
  end

  def initialize(board = Board.default_board)
    @board_grid = board
    @ships = Ships.create_ships
    rand_populate_board
  end

  def place_random_ship
    x, y = rand(@board_grid.length), rand(@board_grid[0].length)
    self[[x,y]] = :S
  end
