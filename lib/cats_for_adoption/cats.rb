class CatsForAdoption::Cats

  attr_accessor :name, :breed, :sex, :story

  def self.list_all 
    # within this method, I need a bunch of instances of Cats
    # a here doc is a long comment
    puts <<-DOC.gsub /^\s*/, ''
      1. Lola
      2. Dextoo
      3. Peppone
    DOC

    cat_1 = self.new
    cat_1.name = "Lolabear"
    cat_1.breed = "Russian Blue "
    cat_1.sex = "Female Adult"
    cat_1.story = "Story"

    cat_2 = self.new
    cat_2.name = "Dextoo"
    cat_2.breed = "Tabby"
    cat_2.sex = "Male Tabby"
    cat_2.story = "Story"

    [cat_1, cat_2]
  end




end 