class CatsForAdoption::Cats

  attr_accessor :name, :color, :breed, :sex, :story

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

    # need a name, breed, sex, story
    # I can get name, breed, sex from the index page 
    # to get story I need to go a level deeper into the profile page 
    # alot of trouble grabbing stuff other than name - lets try just name for now
    # this code gets you close to the text you need for breed and sex -- doc.css("div.pet_results.rounded_corner").first.text.strip.split("\n")
    #doc.css("div.pet_results.rounded_corner").each do |cat_index|


    name = doc.css("p.truncate.no_top_margin a.name.museo700.track").first.text.strip
    
    # aspca site name doc.css("div.link.status-1").first.text.strip
    #name = doc.css("p.truncate.no_top_margin a.name.museo700.track").first.text.strip
    #breed = 
  end

  def self.scrape_cat_profile_pages
    # need to iterate on all the cat profile urls - will test with a single one for now
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats/mauro-a30197092"))
    binding.pry
    
    color = doc.css("div.field.field-name-field-color.field-type-text.field-label-inline").css("div.field-items").css("div.field-item.even").text


  end




end 