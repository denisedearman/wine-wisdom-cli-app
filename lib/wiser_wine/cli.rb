class WiserWine::CLI

  def call
    menu
  end

  def welcome
    puts "Welcome to Wiser Wine"
  end

  def list_regions
    @region_list = WiserWine::Region.all
    @region_list.each.with_index(1) do |region , index|
      puts "#{index}. #{region.name}"
    end
  end

  def menu
    welcome
    input = nil
    while input != "exit"
      puts "Enter the number for a wine region from the list provided to get more info or exit to quit."
      list_regions
      input = gets.strip.downcase
      if input.to_i != 0
        region = @region_list[input.to_i-1]
        puts "#{region.description}"
      elsif input == "exit"
          puts "Goodbye friend!"
      else
          puts "I didn't understand what you wanted."
      end
    end

  end




end
