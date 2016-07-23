class CatsForAdoption::Cats

  attr_accessor :name, :breed, :sex, :story

  def self.list_all 
    # within this method, I need a bunch of instances of Cats
    # a here doc is a long comment
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Lola
    #   2. Dextoo
    #   3. Peppone
    # DOC
    self.scrape_cats
  end

  def self.scrape_cats
    cats = [] 
    # need to scrape the cat website and return cats based on the data
    # go to cat website - scrape the indexes
    # instantiate a cat 
    # add it to an array of cats

    cats << self.scrape_cat_index

   
    cats 
  end

  def self.scrape_cat_index
    doc = Nokogiri::HTML(open("http://www.adoptapet.com/shelter80748-cats.html"))
    binding.pry

    # need a name, breed, sex, story
    # I can get name, breed, sex
  end




end 