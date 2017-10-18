class Monkey
  attr_accessor :name, :species, :foods_eaten

  def initialize(name,species)
    @species = species
    @name = name.capitalize
    @foods_eaten = []
  end

  def eat(food)
    @foods_eaten << food unless ["a","e","y","u","i","o"].include? food[0]
  end

  def introduce
    introduce = []
    introduce = @foods_eaten << @name << @species
    return introduce
  end

end
