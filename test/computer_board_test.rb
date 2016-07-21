require_relative "test_helper"
require "./lib/computer_board"

class ComputerBoardTest < Minitest::Test

  def test_class_computer_board_is_valid
    assert ComputerBoard
  end

  def test_computerboard_has_access_to_the_needed_classes
    assert_equal(Array, ComputerBoard.new.ships.class)
  end

  def test_attack_passes_an_argument
    cmpter_board = ComputerBoard.new
    assert_equal nil, cmpter_board.attack([1,0])
  end

  def test_valid_move?
    cmpter_board = ComputerBoard.new
    assert_equal true, cmpter_board.valid_move?([1,0])
  end

  def test_rand_populate_board_big_ship
    cmpter_board = ComputerBoard.new
    assert_equal :big_ship, cmpter_board.rand_populate_board.first.name
  end

  def test_rand_populate_board_small_ship
    cmpter_board = ComputerBoard.new
    assert_equal :small_ship, cmpter_board.rand_populate_board.last.name
  end

  def test_rand_populate_board_big_ship_length_is_accessable
    cmpter_board = ComputerBoard.new
    assert_equal 3, cmpter_board.rand_populate_board.first.length
  end

  def test_rand_populate_board_small_ship_length_is_accessable
    cmpter_board = ComputerBoard.new
    assert_equal 2, cmpter_board.rand_populate_board.last.length
  end

  def test_placed_ship
    cmpter_board = ComputerBoard.new
    assert_equal nil, cmpter_board.placed_ship([1,2], [0, -1,], 3)
  end

  def test_valid_ship_placed?
    cmpter_board = ComputerBoard.new
    assert_equal nil, cmpter_board.placed_ship([1,2], [0, -1,], 3)
  end

  def test_if_create_array_with_array_method
    cmpter_board = ComputerBoard.new
    assert_equal nil, cmpter_board.placed_ship([1,2], [0, -1,], 3)
  end

end
