require 'terminal-table/import'

class Grids

  def welcome_message
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def intructions_grid
    rows = []
    rows << ["=>", "Each player starts with a fleet of 2 ships, of length 3 and 2."]
    rows << ["=>", "Each player places their ships horizontally or vertically on a 4x4 grid; this is not visible to their opponent."]
    rows << ["=>", "Players take turns to fire at positions on the grid, gradually revealing where their opponent’s ships are and are not located."]
    rows << ["=>", "A ship is destroyed when every cell of a ship has been hi"]
    rows << ["=>", "The winner is the first player to destroy their opponent’s fleet."]
    rows << ["=>", "You do not place the correct number and size of ships."]
    rows << ["=>", "You place your fleet in impossible positions (ships overlapping or partly off the board)."]
    rows << ["=>", "All your ships have been sunk."]
    puts table(["BATTLESHIP", "INSTRUCTIONS" ], *rows)

  end

  def good_bye_grid
    rows = []
    rows << ["I hope you enjoyed the game!!"]
    puts table(["         GOODBYE !!"], *rows)
  end

  def computer_message_lay_small_ship
    rows = []
    rows << ["I have laid out my ships on the grid."]
    rows << ["You now need to layout your two ships."]
    rows << ["The first is two units long and the second is three units long."]
    rows << ["The grid has A1 at the top left and D4 at the bottom right"]
    rows << ["Enter the squares for the two-unit ship: (example A1 A2)"]
    puts table(["                      MESSAGE"], *rows)
  end

  def computer_message_lay_big_ship
    rows = []
    rows << ["The grid has A1 at the top left and D4 at the bottom right"]
    rows << ["Enter the squares for the three-unit ship: (example C1 C2 C3)"]
    puts table(["                      MESSAGE"], *rows)
  end


end
