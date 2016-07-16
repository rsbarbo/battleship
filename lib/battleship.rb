require "./lib/grids"
require "pry"

class Battleship
  attr_reader :grids

  def initialize
      @grids = Grids.new
  end


  def welcome_message
    p "Welcome to BATTLESHIP" && "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_welcome
    welcome_message
    user_input = gets.chomp.to_s.downcase
    input_processor(user_input)
  end

  def input_processor
  end

  def play_game
  end

  def instructions
    grids.intructions_grid
    #will call the play_game method
  end

  def quit_game
    grids.good_bye_grid
  end

end
