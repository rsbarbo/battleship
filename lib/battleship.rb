require "./lib/grids"
require "./lib/game_board"
require "pry"

module Battleship
  class Repl
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
      difficulty_level
    end

    def difficulty_level
      grids.difficulty_level_grid
      p "Please choose difficulty level:"
      difficult_input = gets.chomp.to_s.downcase
      Battleship::GameBoard.new(difficult_input)
    end

    def instructions
      grids.intructions_grid
      secondary_game_welcome
    end

    def quit_game
      grids.good_bye_grid
    end

  end
end

battle = Battleship::Repl.new
battle.game_welcome
