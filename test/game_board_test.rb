require_relative "test_helper"
require "./lib/game_board"

class GameBoardTest < Minitest::Test

  def test_class_game_board_is_valid
    assert(GameBoard)
  end


end
