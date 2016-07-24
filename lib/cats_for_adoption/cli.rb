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
  
    @cats = CatsForAdoption::Cats.list_all

    @cats.each.with_index(1) do |cat, idx|
      puts "#{idx}. #{cat.name}" + "\n" + 
      "#{cat.color}" + "\n" +
      "#{cat.breed}"
      spaces 
    end
  end

  def choose_cats
    spaces
    
    input = nil
    
     puts "Please choose the cat number you're interested in" + "\n" +
    "You can also type 'list' to return to the Cat menu" + "\n" +
     "Type 'exit' to quit"

    while input != "exit"

    spaces 

    input = gets.chomp.downcase

    puts "type 'list' a cat number or 'exit'"

      if input.to_i < 9 
        cat = @cats[input.to_i-1]
         puts "#{cat.name}" + "\n" + 
          "#{cat.color}" + "\n" +
          "#{cat.breed}" + "\n" + 
          "#{cat.age}" + "\n" + 
          "#{cat.gender}" + "\n" + "\n" + 
          "#{cat.story}" 
          spaces 

      elsif input == "list"
        
        list_cats
      
      elsif input == exit 
        goodbye
      end
    end
  end

  def goodbye
    puts "Thanks for checking in!"
  end

end