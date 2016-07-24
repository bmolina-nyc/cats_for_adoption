class CatsForAdoption::Cats

  attr_accessor :name, :color, :breed, :gender, :age, :story

  # this method lists returns every cat object in the array
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

  # a method that takes instantiated cats and pushes them into an array of cat objects
  def self.scrape_cats
    # need to scrape the cat website and return cats based on the data
    # go to cat website - scrape the indexes
    # instantiate a cat 
    # add it to an array of cats
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
    
    if doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p")[3..5].any? { |el| el != nil }
        cat.story = doc.css("div.field.field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p")[3..5].text
    else
        cat.story = "No Bio Available"
    end
    
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
    while i < 4
        urls_array << doc.css("div.view-content").css("div.views-row-odd.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        urls_array << doc.css("div.view-content").css("div.views-row-even.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        i += 1 
    end
    urls_array
  end




end 