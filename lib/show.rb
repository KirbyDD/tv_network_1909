class Show
  attr_reader :name, :creator, :characters
  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    sum = @characters.reduce(0) do |acc, char|
      acc += char.salary
      acc
    end
    sum
  end
end