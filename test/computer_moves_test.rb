require_relative "test_helper"
require "./lib/computer_moves"

class ComputerMovesTest < Minitest::Test

  def test_moves_class_exits
    assert ComputerMoves
  end

  def test_all_positions_exist_within_methods
    positions = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal positions, ComputerMoves.new.all_moves
  end

end
