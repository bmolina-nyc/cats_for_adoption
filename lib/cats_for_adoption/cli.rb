class CatsForAdoption::CLI


  def call
    list_cats
    choose_cats
    goodbye 
  end

  def list_cats
    puts "Cats for Adoption:"

  
    @cats = CatsForAdoption::Cats.list_all# need a method here to scrape the cats

    @cats.each.with_index(1) do |cat, idx|
      puts "#{idx}. #{cat.name} #{cat.breed} #{cat.sex} #{cat.story}"
    end
  end

  def choose_cats
    input = nil
    while input != "exit"
    
    puts "please choose the cat number you're interested or list to see the cats menu or type exit:"
    input = gets.chomp.downcase 

      if input.to_i > 0 
        the_cat = @cats[input.to_i-1]
        puts "#{the_cat.name} #{the_cat.breed} #{the_cat.sex} #{the_cat.story}"
      elsif input == "list"
        list_cats
      else
        puts "not sure what you want - type list, a cat number or exit"
      end
    end
  end

  def goodbye
    puts "Thanks for checking in!"
  end

end