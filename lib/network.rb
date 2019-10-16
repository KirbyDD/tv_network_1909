class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show show
    @shows << show
  end

  def highest_paid_actor
    check_array = @shows.map {|show| show.characters}.flatten
    char = check_array.max {|char, char2| char.salary <=> char2.salary}
    char.actor
  end
end