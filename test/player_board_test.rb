require_relative "test_helper"
require "./lib/player_board"

class PlayerBoardTest < Minitest::Test

  def test_moves_class_exits
    assert PlayerBoard
  end

  def test_translate_ship_coords
    assert_equal [[0, 0], [0, 1]], PlayerBoard.new.grab_coords("a1 a2")
  end

  def test_insert_ship_with_coordinates
    assert_equal [[0, 0], [0, 1]], PlayerBoard.new.insert_ship([[0, 0], [0, 1]])
  end

  def test_place_ship
    assert_equal :Ship, PlayerBoard.new.place_ship(0,1)
  end

  def test_attack_ship
    assert_equal nil, PlayerBoard.new.attack([0, 2])
  end

end
