class Character
  attr_reader :name, :actor, :salary
  def initialize(obj)
    @name = obj[:name]
    @actor = obj[:actor]
    @salary = obj[:salary]
  end
end