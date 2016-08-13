class CatsForAdoption::Scraper
  
  def self.scrape_cat_profile_page
    # need to iterate on all the cat profile urls and add in the beginning of the website url
    #cat_instances = []
    urls_array = self.index_page_urls 

    urls_array.each do |url|

    doc = Nokogiri::HTML(open("http://www.aspca.org#{url}"))
 
 
    cat = CatsForAdoption::Cat.new(
      {
      :name => doc.css(".field-label-inline").css("div.field-items").css("div.field-item.even").first.text,
      :color => doc.css(".field-name-field-color.field-type-text.field-label-inline").css("div.field-items").text,
      :breed => doc.css(".field-name-field-breed.field-type-text.field-label-inline").css("div.field-items").text,
      :gender => doc.css(".field-name-field-gender.field-type-list-text.field-label-inline").css("div.field-items").text,
      :age => doc.css(".field-name-field-birthdate.field-type-datetime.field-label-inline").css("div.field-item.even").text.strip,  
      #need to see how to strip extra text or trim the below - paragraphs might be too embedded and changing from page to page. below works good so far though 
      # refactor below for a method to clean up all the gsubs here?
      :story => doc.css(".field-name-body.field-type-text-with-summary.field-label-hidden").css("div.field-item.even").css("p")[1..5].text.gsub("As part of our adoption program, some of our feline friends have the opportunity to live in ASPCA team members' offices. Living in an office allows cats to have a more comfortable and domestic living space, and allows our behaviorists to learn more about each individual kitty's personality and needs. Through the office foster program, we are able to offer adopters a clearer picture of how their new feline friend will adjust to life in a permanent home.", "").gsub(/More About Him:/, "").gsub(/More About Her:/,"").gsub(/About Him:/, "").gsub(/About Her:/,"")
      }
    )
    end # thurgood has no story and is breaking my scrape! iterating only upto 8 cats so I can carry on with this lab 
  end

  #goal of this method is to collect all cat urls and have them ready to deliver for the method above - must collect all 10
  def self.index_page_urls
    doc = Nokogiri::HTML(open("http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats"))#.css("div.field-item.")
    urls_array = []
    i = 0 
    while i < 4  # this is subject to change based on how they update their website - keep it at 8 cat listing cause 10 will break below 
        urls_array << doc.css("div.view-content").css("div.views-row-odd.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        urls_array << doc.css("div.view-content").css("div.views-row-even.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
        i += 1 
    end
    urls_array
  end # def 

end  #class