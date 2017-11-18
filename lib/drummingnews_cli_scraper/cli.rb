class DrummingNews::CLI
  attr_accessor :articles, :current_magazine

  def start
    DrummingNews::Scraper.scrape_md 
    DrummingNews::Scraper.scrape_drum 
    DrummingNews::Scraper.scrape_rhythm 
    call
  end

  def call
    choose_mag    
    list_articles
    choose_article
  end

  def choose_mag
    puts "Which site's articles would you like to view?"
    puts "1. Modern Drummer"
    puts "2. DRUM!"
    puts "3. Rhythm Magazine"
    puts "Or 'exit' to quit"
    mag_choice = ""
    mag_choice = gets.strip 
    case mag_choice.downcase 
      when "1"
        @articles = Modern_drummer.articles ###Find magazine by title and get articles
        @current_magazine = Modern_drummer
      when "2"
        @articles = DRUM.articles
        @current_magazine = DRUM
      when "3"
        @articles = Rhythm.articles
        @current_magazine = Rhythm
      when "exit"
        exit
      else
        puts "Please enter 1-3 or 'exit'"
        choose_mag
    end
  end

  def list_articles
    puts "\n------------------------------------------"
    @articles.each_with_index do |article, index|
      puts "#{index + 1}. #{article.title}"
    end
    puts "------------------------------------------\n"
  end

  def choose_article
    puts "Which one would you like to view? Enter 'back' to go to the main menu, or 'exit' to quit"
    article_choice = gets.strip
    until article_choice.to_i.between?(1, 10) || article_choice.downcase == "back" || article_choice.downcase == "exit" do 
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
    article_url =  @current_magazine.find(article_choice).url
    article_content = DrummingNews::Scraper.scrape_article(article_url, @current_magazine, article_choice)
    puts article_content
    call
  end
end