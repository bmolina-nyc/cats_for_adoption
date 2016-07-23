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
    
    name =  doc.css("div.link.status-1").first.text.strip   # a cats name from the index page 
  
  end

  def self.scrape_cat_profile_pages
    # need to iterate on all the cat profile urls - will test with a single one for now
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats/mauro-a30197092"))
    binding.pry
    
    color = doc.css("div.field.field-name-field-color.field-type-text.field-label-inline").css("div.field-items").text
    breed = doc.css("div.field.field-name-field-breed.field-type-text.field-label-inline").css("div.field-items").text
    gender = doc.css("div.field.field-name-field-gender.field-type-list-text.field-label-inline").css("div.field-items").text
    age = doc.css("div.field.field-name-field-birthdate.field-type-datetime.field-label-inline").css("div.field-item.even").text.strip    
    
    case gender 
      when "Male"
        story = doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p").text.gsub("Office Foster CatAs part of our adoption program, some of our feline friends have the opportunity to live in ASPCA team members' offices. Living in an office allows cats to have a more comfortable and domestic living space, and allows our behaviorists to learn more about each individual kitty's personality and needs. Through the office foster program, we are able to offer adopters a clearer picture of how their new feline friend will adjust to life in a permanent home.More About Him:" , "")
      when "Female"
         story = doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p").text.gsub("Office Foster CatAs part of our adoption program, some of our feline friends have the opportunity to live in ASPCA team members' offices. Living in an office allows cats to have a more comfortable and domestic living space, and allows our behaviorists to learn more about each individual kitty's personality and needs. Through the office foster program, we are able to offer adopters a clearer picture of how their new feline friend will adjust to life in a permanent home.More About Her:" , "")
    end
  end




end 