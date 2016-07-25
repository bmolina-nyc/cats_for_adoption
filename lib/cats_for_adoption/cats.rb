class CatsForAdoption::Cats

  attr_accessor :name, :color, :breed, :gender, :age, :story

  # this method lists returns every cat object in the array
  # within this method, I need a bunch of instances of Cats
  def self.list_all 
    self.scrape_cat_profile_page
  end

    # need a name, color, breed, gender, age, story
    # I can get all of this from a cats personal profile page 

  def self.scrape_cat_profile_page
    # need to iterate on all the cat profile urls and add in the beginning of the website url
    cat_instances = []
    urls_array = self.index_page_urls 

    urls_array.each do |url|

    doc = Nokogiri::HTML(open("http://www.aspca.org#{url}"))
 
    cat = self.new 
    cat.name = doc.css("div.field.field-label-inline").css("div.field-items").css("div.field-item.even").first.text
    cat.color = doc.css("div.field.field-name-field-color.field-type-text.field-label-inline").css("div.field-items").text
    cat.breed = doc.css("div.field.field-name-field-breed.field-type-text.field-label-inline").css("div.field-items").text
    cat.gender = doc.css("div.field.field-name-field-gender.field-type-list-text.field-label-inline").css("div.field-items").text
    cat.age = doc.css("div.field.field-name-field-birthdate.field-type-datetime.field-label-inline").css("div.field-item.even").text.strip  
    #need to see how to strip extra text or trim the below - paragraphs might be too embedded and changing from page to page. below works good so far though 
    # refactor below for a method to clean up all the gsubs here?
    cat.story = doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p")[1..5].text.gsub("As part of our adoption program, some of our feline friends have the opportunity to live in ASPCA team members' offices. Living in an office allows cats to have a more comfortable and domestic living space, and allows our behaviorists to learn more about each individual kitty's personality and needs. Through the office foster program, we are able to offer adopters a clearer picture of how their new feline friend will adjust to life in a permanent home.", "").gsub(/More About Him:/, "").gsub(/More About Her:/,"").gsub(/About Him:/, "").gsub(/About Her:/,"")
    
    cat_instances << cat 
    end
    # thurgood has no story and is breaking my scrape! iterating only upto 8 cats so I can carry on with this lab
    cat_instances
  end

  #goal of this method is to collect all cat urls and have them ready to deliver for the method above - must collect all 10
  def self.index_page_urls
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats"))
    urls_array = []
    
    i = 0 
    while i < 5  
        urls_array << doc.css("div.view-content").css("div.views-row-odd.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        urls_array << doc.css("div.view-content").css("div.views-row-even.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        i += 1 
    end
    urls_array
  end

end 