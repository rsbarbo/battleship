require "pry"

class Ships

  SHIPS = {big_ship: 3,small_ship: 2}

  DIRECTIONS = [[0, 1],[0, -1],[1, 0],[-1, 0]]


  def self.create_ships
    ships = []
    Ships.names.each do |ship_name|
      ships << Ships.new(ship_name, Ships::SHIPS[ship_name])
    end
  end

  def self.names
    names = []
    SHIPS.keys.each do |boat|
      names.push(boat)
    end
  end

  def initialize(name, length)
    @name = name
    @length = length
  end

end
