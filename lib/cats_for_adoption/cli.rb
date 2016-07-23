class CatsForAdoption::CLI


  def call
    list_cats
    choose_cats
    goodbye 
  end

  def list_cats
    puts "Cats for Adoption:"

  
    @cats = CatsForAdoption::Cats.list_all# need a method here to scrape the cats
  end

  def choose_cats
    
    input = nil

    while input != "exit"
    
    puts "please choose the cat number you're interested or list to see the cats menu or type exit:"
    input = gets.chomp.downcase 

      case input 
        when "1"
          puts "More info on Lola"
        when "2"
          puts "More info on Dextoo"
        when "3"
          puts "More info on Peppone"
        when "list"
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