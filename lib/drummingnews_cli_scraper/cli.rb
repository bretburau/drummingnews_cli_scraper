class DrummingNews::CLI
  attr_accessor :articles
  def call
    puts "Welcome to you drumming newsfeed!"
    puts ""
    puts "Which site's articles would you like to view?"
    puts "1. Modern Drummer"
    puts "2. DRUM!"
    puts "3. Classic Drummer"
    puts "4. Innovative Percussion"
    puts "Or 'exit' to quit"
    choose_mag    
    list_articles
    #call until choose_mag == false ### To loop, I don't like it
  end

  def choose_mag
    scraper = DrummingNews::Scraper.new #Instansiate scraper
    mag_choice = ""
    mag_choice = gets.strip until mag_choice.to_i.between?(1,4) || mag_choice.downcase == "exit"
    case mag_choice.downcase
    when "1"
      @articles = scraper.modern_drummer #puts "modern drumme"
    when "2"
      @articles = scraper.drum #puts "drum!"
    when "3"
      @articles = scraper.classic_drummer #puts "classic drummer"
    when "4" 
      @articles = scraper.ip #puts "Innovative Percussion"
    when "exit"
      false
    end
  end

  def list_articles
    puts "------------------------------------------"
    @articles.each_with_index do |article, index|
      puts "#{index + 1}. #{article.title} - #{article.author} #{article.date}"
    end
  end


end