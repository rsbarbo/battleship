require "pry"
require "./lib/grids"

module Battleship
  class Board
    attr_reader :difficulty_level, :board_size

    def initialize(difficulty_input)
      @grids = Battleship::Grids.new
      @difficulty_level = board_director(difficulty_input)
      @board_size = 0
      @fleet_size = 0
    end



    def beginner_level
      board(@board_size = 4)
    end

    def intermediate_level
      board(@board_size = 8)
    end

    def advanced_level
      board(@board_size = 12)
    end

  end
end
