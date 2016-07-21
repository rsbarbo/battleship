require "./lib/grids"
require "./lib/computer_board"
require "./lib/game"
require "pry"

class Battleship
  attr_reader :grids, :game

  def initialize
    @grids = Grids.new
    @game = Game.new
  end

  def game_welcome
    grids.welcome_message
    user_input = gets.chomp.to_s.downcase
    input_processor(user_input)
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
    if __FILE__ == $PROGRAM_NAME
      system("clear")
      print "Please enter your name >> "
      name = gets.chomp
      puts "Hello #{name}, I hope you are ready to play!\n We are starting in..."
      sleep(1)
      puts "3"
      sleep(0.5)
      puts "2"
      sleep(0.5)
      puts "1"
      sleep(0.5)
      system("clear")
      game.play
    end
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
