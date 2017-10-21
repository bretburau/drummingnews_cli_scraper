class DrummingNews::CLI

  def call
    puts "Welcome to you drumming newsfeed!"
    puts ""
    puts "Which site's articles would you like to view?"
    puts "1. Modern Drummer"
    puts "2. DRUM!"
    puts "3. Something Else"
    puts "4. Others"
    puts "Or 'exit' to quit"
    mag_choice = ""
    mag_choice = gets.strip until mag_choice.to_i.between?(1,4) || mag_choice.downcase == "exit"

    case mag_choice
    when "1"
      puts "modern drumme"
    when "2"
      puts "drum!"
    when "3"
      puts "something else"
    when "4" 
      puts "others"
    end
    
  end
end