class CatsForAdoption::Cats

  attr_accessor :name, :color, :breed, :gender, :age, :story

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

    cats << self.scrape_cat_indexes

   
    cats 
  end

  def self.scrape_cat_indexes
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats"))
    binding.pry

    # need a name, color, breed, gender, age, story
    # I can get name from the index page 
    # other items come from the cats personal profile page 



    name = doc.css("p.truncate.no_top_margin a.name.museo700.track").first.text.strip
    
    # aspca site name doc.css("div.link.status-1").first.text.strip
    #name = doc.css("p.truncate.no_top_margin a.name.museo700.track").first.text.strip
    #breed = 
  end

    def self.scrape_cat_indexes_orig
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats")
    binding.pry

    # need a name, color, breed, gender, age, story
    # I can get name from the index page 
    # other items come from the cats personal profile page 

    
    name =  doc.css("div.link.status-1").first.text.strip
    
  end

  def self.scrape_cat_profile_pages
    # need to iterate on all the cat profile urls - will test with a single one for now
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats/mauro-a30197092"))
    binding.pry
    
    color = doc.css("div.field.field-name-field-color.field-type-text.field-label-inline").css("div.field-items").css("div.field-item.even").text


  end




end 