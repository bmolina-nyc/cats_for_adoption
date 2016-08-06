class CatsForAdoption::CLI

  def call
    list_cats
    choose_cats
    goodbye 
  end

  def spaces
     1.times { puts "\n" }
   end

  def list_cats
    puts "Cats for Adoption:"
    spaces 
  
    @cats = CatsForAdoption::Scraper.new.all

    @cats.each.with_index(1) do |cat, idx|
      puts "#{idx}. #{cat.name}" + "\n" + 
      "#{cat.color}" + "\n" +
      "#{cat.breed}"
      spaces 
    end
    puts "type 'list' a cat number or 'exit'"
  end
  
  def choose_cats
    spaces
    
    input = nil
    
     puts "Please choose the cat number you're interested in" + "\n" +
    "You can also type 'list' to return to the Cat menu" + "\n" +
     "Type 'exit' to quit"

    until input == "exit"

    spaces 

    input = gets.chomp.downcase

      if input.to_i.between?(1,10)
          cat_bio(input)
          spaces 

          puts "type 'list' a cat number or 'exit'"
      elsif input == "list"
          system('clear')
          list_cats
      elsif input == "exit"
        break
      else
        puts "I'm not sure what you mean - please type 'list' a cat number or 'exit' "
      end
    end
  end

  def goodbye
    puts "Thanks for checking in - Meow!"
  end

   def cat_bio(value)
    cat = @cats[value.to_i-1]
    puts "#{cat.name}" + "\n" + 
      "#{cat.color}" + "\n" +
      "#{cat.breed}" + "\n" + 
      "#{cat.age}" + "\n" + 
      "#{cat.gender}" + "\n" + "\n" + 
      "#{cat.story}"   
  end

end