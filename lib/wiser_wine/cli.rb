class WiserWine::CLI
  def initialize
    @grape_varieties = []
  end

  def call
    menu
  end

  def welcome
    puts "Welcome to Wiser Wine!"
  end

  def goodbye
    puts "Goodbye friend!"
  end


  def list_grapes
    if @grape_varieties.length == 0
      puts "Fetching your grape list your patience is appreciated...."
      @grape_varieties = WiserWine::GrapeVariety.all
    end
    @grape_varieties.each.with_index(1) do |grape , index|
        puts "#{index}. #{grape.name}"
    end

  end

  def menu
    welcome
    input = nil
    while input != "exit"
      puts "Enter the number for a wine grape variety to get more info or type exit to quit."
      list_grapes
      input = gets.strip.downcase
      if input.to_i != 0 && input.to_i <= @grape_varieties.length
        grape = @grape_varieties[input.to_i-1]
        grape.print_details
        puts "Would you like information about a different wine? Hit enter to continue or type 'no' to quit."
        again = gets.strip.downcase
        if again == "no"
          input = "exit"
          goodbye
        end
      elsif input == "exit"
        goodbye
      else
          puts "I didn't understand what you wanted."
      end
    end

  end




end
