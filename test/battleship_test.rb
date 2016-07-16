require_relative "test_helper"
require "./lib/grids"
require "./lib/battleship"

class BattleshipTest < Minitest::Test

  def test_class_battleship_is_valid?
    assert(Battleship)
  end

  def test_welcome_message
    battleship = Battleship.new
    wlcm_msg = "Welcome to BATTLESHIP" && "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal wlcm_msg, battleship.welcome_message
  end

    describe "Test Welcoming users" do
      before { def user_input; "p" || "play" end}
      it "expected_input" do
        user_input.must_equal "p" || "play"
      end
    end

    def test_instructions_are_given
      battleship = Battleship.new
      assert_equal nil, battleship.instructions
      #it will equal neil because of the puts calls, but it returns the grid
    end

    def test_goodbye_message_are_given
      battleship = Battleship.new
      assert_equal nil, battleship.quit_game
      #it will equal neil because of the puts calls, but it returns the grid
    end


end
