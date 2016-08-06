class CatsForAdoption::Cat

  attr_accessor :name, :color, :breed, :age, :gender, :story

  @@all = [] 

  def self.all 
    @@all 
  end

  def self.all_clear
    @@all.clear
  end

  def initialize(attributes = {})
    @name = attributes[:name]
    @color = attributes[:color]
    @breed = attributes[:breed]
    @age = attributes[:age]
    @story = attributes[:story]
    @@all << self 
  end

end 