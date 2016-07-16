require "./lib/grids"
require "pry"

class Battleship
  attr_reader :grids

  def initialize
    @grids = Grids.new
  end

  def game_welcome
    welcome_message
    user_input = gets.chomp.to_s.downcase
    input_processor(user_input)
  end

  def welcome_message
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def secondary_game_welcome
    p "Would you like to (p)lay or (q)uit?"
    user_input = gets.chomp.to_s.downcase
    input_processor(user_input)
  end

  def input_processor(user_input)
    if user_input == "p" || user_input == "play"
      play_game
    elsif user_input == "i" || user_input == "instructions"
      instructions
    elsif user_input == "q" || user_input == "quit"
      quit_game
    else
      error_message_for_wrong_entry
    end
  end

  def error_message_for_wrong_entry
    puts "\nERROR!!! ERROR!!! ERROR!!! ERROR!!! ERROR!!! ERROR!!!\n
    please make sure you entered a valid option\n\n".upcase
    game_welcome
  end

  def play_game
  end

  def instructions
    grids.intructions_grid
    secondary_game_welcome
  end

  def quit_game
    grids.good_bye_grid
  end

end

battle = Battleship.new
battle.game_welcome
