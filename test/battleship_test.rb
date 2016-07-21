require_relative "test_helper"
require "./lib/grids"
require "./lib/battleship"

class BattleshipTest < Minitest::Test


  def test_class_game_board_is_valid
    assert Battleship
  end

  def test_battleship_has_access_to_the_needed_classes
    assert_equal(Grids, Battleship.new.grids.class)
    assert_equal(Game, Battleship.new.game.class)
  end

end
