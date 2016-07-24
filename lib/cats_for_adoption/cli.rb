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
    end
  end

  def choose_cats
    spaces
    input = nil
    
    while input != "exit"
    spaces 

    puts "Please choose the cat number you're interested in" + "\n" + "You can also type 'list' to return to the Cat menu" + "\n" + "Type 'exit' to quit"

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