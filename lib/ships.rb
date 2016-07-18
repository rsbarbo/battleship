require "pry"

class Ships

  SHIPS = {big_ship: 3,small_ship: 2}

  DIRECTIONS = [[0, 1],[0, -1],[1, 0],[-1, 0]]

  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def self.create_ships
    Ships.names.map do |ship_name|
      Ships.new(ship_name, Ships::SHIPS[ship_name])
    end
  end

  def self.names
    names = []
    SHIPS.keys.each do |boat|
      names.push(boat)
    end

  end



end
