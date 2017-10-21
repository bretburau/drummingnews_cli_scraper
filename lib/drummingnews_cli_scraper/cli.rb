class DrummingNews::CLI

  def call
    puts "Welcome to you drumming newsfeed!"
    puts ""
    puts "Which site's articles would you like to view?"
    puts "1. Modern Drummer"
    puts "2. DRUM!"
    puts "3. Classic Drummer"
    puts "4. Innovative Percussion"
    puts "Or 'exit' to quit"
    mag_choice = ""
    mag_choice = gets.strip until mag_choice.to_i.between?(1,4) || mag_choice.downcase == "exit"

    scraper = DrummingNews::Scraper.new #Instansiate scraper

    case mag_choice
    when "1"
      scraper.modern_drummer #puts "modern drumme"
    when "2"
      scraper.drum #puts "drum!"
    when "3"
      scraper.classic_drummer #puts "classic drummer"
    when "4" 
      scraper.ip #puts "Innovative Percussion"
    end
    
  end
end