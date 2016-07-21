require_relative "test_helper"
require "./lib/grids"

class GridsTest < Minitest::Test

  def test_moves_class_exits
    assert Grids
  end

  def test_welcome_message
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Grids.new.welcome_message
  end

end
