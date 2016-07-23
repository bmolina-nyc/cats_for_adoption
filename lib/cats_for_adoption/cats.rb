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

    cats << self.scrape_cat_profile_page

   
    cats 
  end

    # need a name, color, breed, gender, age, story
    # I can get all of this from a cats personal profile page 

  def self.scrape_cat_profile_page
    # need to iterate on all the cat profile urls - will test with a single one for now
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats/mauro-a30197092"))
 

    cat = self.new 
    cat.name = doc.css("div.field.field-label-inline").css("div.field-items").css("div.field-item.even").first.text
    cat.color = doc.css("div.field.field-name-field-color.field-type-text.field-label-inline").css("div.field-items").text
    cat.breed = doc.css("div.field.field-name-field-breed.field-type-text.field-label-inline").css("div.field-items").text
    cat.gender = doc.css("div.field.field-name-field-gender.field-type-list-text.field-label-inline").css("div.field-items").text
    cat.age = doc.css("div.field.field-name-field-birthdate.field-type-datetime.field-label-inline").css("div.field-item.even").text.strip    
    #need to see how to strip extra text or trim the below - paragraphs might be too embedded and changing from page to page. below works good so far though 
    cat.story = doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p")[3..5].text
     

    cat 
  end




end 