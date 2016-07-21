class ComputerMoves
  attr_reader :moves_to_play

  def initialize
    @moves_to_play = all_moves
  end

  def all_moves
    first_two_rows = %w(A1 A2 A3 A4 B1 B2 B3 B4 )
    last_two_rows = %w(C1 C2 C3 C4 D1 D2 D3 D4 )
    first_two_rows + last_two_rows
  end
end
