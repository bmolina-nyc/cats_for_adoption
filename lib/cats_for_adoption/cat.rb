class CatsForAdoption::Cat

  attr_accessor :name, :color, :breed, :gender, :age, :story

  def initialize(attributes = {})
    @name = attributes[:name]
    @color = attributes[:color]
    @breed = attributes[:breed]
    @age = attributes[:age]
    @story = attributes[:story]
  end

end 