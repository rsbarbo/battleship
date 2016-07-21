require_relative "test_helper"
require "./lib/game"

class GameTest < Minitest::Test

  def test_moves_class_exits
    assert Game
  end

  def test_computer_moves_are_available
    moves = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal moves, Game.new.computer_moves
  end

  def test_board_grid_count_is_four
    assert_equal 4, Game.new.computer_board.board_grid.count
  end

  def test_big_ship_is_available_within_game
    assert_equal true, Game.new.computer_board.ships.first.name == :big_ship
  end

  def test_small_ship_is_available_within_game
    assert_equal true, Game.new.computer_board.ships.last.name == :small_ship
  end

  def test_big_ship_length_is_available_within_game
    assert_equal 3, Game.new.computer_board.ships.first.length
  end

  def test_small_ship_length_is_available_within_game
    assert_equal 2, Game.new.computer_board.ships.last.length
  end

  def test_computer_attack_returns_string
    assert_kind_of String , Game.new.computer_attack
  end

  def test_make_move_works
    assert_equal true, Game.new.valid_move?(["a", "1"])
  end

  def test_make_move_works
    assert_equal false, Game.new.valid_move?(["a", "5"])
  end

end
