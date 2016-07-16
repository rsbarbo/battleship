require 'terminal-table/import'

class Grids

  def intructions_grid
    rows = []
    rows << ["=>", "YOU WIN:"]
    rows << ["=>", "Each player starts with a fleet of 2 ships, of length 3 and 2."]
    rows << ["=>\n", "Each player places their ships horizontally or vertically on a 4x4 grid; this is not visible to their opponent."]
    rows << ["=>\n", "Players take turns to fire at positions on the grid, gradually revealing where their opponent’s ships are and are not located."]
    rows << ["=>\n", "A ship is destroyed when every cell of a ship has been hi"]
    rows << ["=>\n", "The winner is the first player to destroy their opponent’s fleet."]
    rows << ["=>\n", "YOU LOSE:"]
    rows << ["=>\n", "You do not place the correct number and size of ships."]
    rows << ["=>\n", "You place your fleet in impossible positions (ships overlapping or partly off the board)."]
    rows << ["=>\n", "All your ships have been sunk."]
    sorted = table(["BATTLESHIP", "INSTRUCTIONS" ], *rows)
    puts sorted
  end

  def good_bye_grid
    rows = []
    rows << ["I hope you enjoyed the game!!"]
    puts table(["         GOOD BYE !!"], *rows)
  end

end
