class DrummingNews::CLI
  attr_accessor :articles

  def call
    puts "Welcome to you drumming newsfeed!"  
    puts ""
    
    @scraper = DrummingNews::Scraper.new #Instansiate scraper
    choose_mag    
    list_articles
    show_article
  end

  def choose_mag
    puts "Which site's articles would you like to view?"
    puts "1. Modern Drummer"
    puts "2. DRUM!"
    puts "3. Classic Drummer"
    puts "4. Innovative Percussion"
    puts "Or 'exit' to quit"
    
    mag_choice = ""
    mag_choice = gets.strip 
    case mag_choice.downcase
      when "1"
        @articles = @scraper.modern_drummer
      when "2"
        @articles = @scraper.drum
      when "3"
        @articles = @scraper.classic_drummer
      when "4" 
        @articles = @scraper.ip
      when "exit"
        exit
      else
        puts "Please enter 1-4 or 'exit'"
        choose_mag
    end
  end

  def list_articles
    puts "------------------------------------------"
    @articles.each_with_index do |article, index|
      puts "#{index + 1}. #{article.title} - #{article.author} - #{article.date}"
    end
  end

  def show_article
    puts "Which one would you like to view? Type 'back' to go to the main menu"
    article_choice = gets.strip
    until article_choice.to_i > 0 || article_choice == "back" do ###Probably gonna need to change condition to a .length or something
      puts "Please enter a valid article number or 'back'"
      article_choice = gets.strip
    end

  end


end