class DrummingNews::CLI
  attr_accessor :articles

  def call
    @scraper = DrummingNews::Scraper.new.scrape_titles #Instansiate scraper, get article titles
    
    choose_mag    
    list_articles
    choose_article
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
    case mag_choice.downcase ####Need to update calls here
      when "1"
        @articles = Modern_drummer.articles ###Find magazine by title and get articles
      when "2"
        @articles = DRUM.articles
      when "3"
        @articles = Classic_drummer.articles
      when "4" 
        @articles = Innovative_percussion.articles
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
      puts "#{index + 1}. #{article.title} - #{article.author} -  #{article.date}"
    end
    puts "------------------------------------------"
  end

  def choose_article
    puts "Which one would you like to view? Enter 'back' to go to the main menu, or 'exit' to quit"
    article_choice = gets.strip
    until article_choice.to_i.between?(1, 10) || article_choice.downcase == "back" || article_choice.downcase == "exit" do ###Probably gonna need to change condition to a .length or something
      puts "Please enter a valid article number or 'back'"
      article_choice = gets.strip
    end
    if article_choice.downcase == "back"
      puts ""
      call
    elsif article_choice.downcase == "exit"
      exit
    else
      display_article(article_choice.to_i)
    end
  end

  def display_article(article_choice)
    puts "you chose #{article_choice}" ###Need to actually display the article...needs scraping
    call
  end

end