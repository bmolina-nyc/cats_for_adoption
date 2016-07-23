class CatsForAdoption::CLI


  def call
    list_cats
    choose_cats
    goodbye 
  end

  def spaces
     2.times { puts "\n" }
   end

  def list_cats
    puts "Cats for Adoption:"
    spaces 
  
    @cats = CatsForAdoption::Cats.list_all# need a method here to scrape the cats

    @cats.each.with_index(1) do |cat, idx|
      puts "#{idx}. #{cat.name}" + "\n" + 
      "#{cat.color}" + "\n" +
      "#{cat.breed}"
    end
  end

  def choose_cats
    spaces
    input = nil
    
    while input != "exit"
    spaces 

    puts "please choose the cat number you're interested or list to see the cats menu or type exit:"
    input = gets.chomp.downcase 

      if input.to_i == 1 # change later 
        cat = @cats[input.to_i-1]
         puts "#{cat.name}" + "\n" + 
          "#{cat.color}" + "\n" +
          "#{cat.breed}" + "\n" + 
          "#{cat.age}" + "\n" + 
          "#{cat.gender}" + "\n" + "\n" + 
          "#{cat.story}"
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