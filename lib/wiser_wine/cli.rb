class WiserWine::CLI

  def call
    menu
  end

  def welcome
    puts "Welcome to Wiser Wine"
  end

  def list_regions
    @grape_varieties = WiserWine::GrapeVariety.all
    @grape_varieties.each.with_index(1) do |grape , index|
      puts "#{index}. #{grape.name}"
    end
  end

  def menu
    welcome
    input = nil
    while input != "exit"
      puts "Enter the number for a wine grape variety to get more info or type exit to quit."
      list_regions
      input = gets.strip.downcase
      if input.to_i != 0 && input.to_i <= @grape_varieties.length
        grape = @grape_varieties[input.to_i-1]
        puts "Common descriptors for #{grape.name} include: #{grape.descriptors.join(", ")}"
      elsif input == "exit"
          puts "Goodbye friend!"
      else
          puts "I didn't understand what you wanted."
      end
    end

  end




end
