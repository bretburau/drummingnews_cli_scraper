class DrummingNews::Scraper
  attr_accessor :magazines
  MAGAZINE_TITLES = ["Modern Drummer", "DRUM!", "Classic Drummer", "Innovative Percussion"]
  def initialize
    @magazines = DrummingNews::Magazine.all
  end

  def scrape_titles ##### instanciate magazines and get titles
    create_magazines
    @magazines.each do |magazine|
      case magazine.name 
        when "Modern Drummer"
          scrape_modern_drummer
        when "DRUM!"
          scrape_drum
        when "Classic Drummer"
          scrape_classic_drummer
        when "Innovative Percussion"
          scrape_ip
        end
    end
  end

  def create_magazines
    MAGAZINE_TITLES.each do |magazine| 
      @magazines << DrummingNews::Magazine.create(magazine) unless DrummingNews::Magazine.all.include?(magazine)
    end
  end

  def scrape_modern_drummer
    list = []
    # if !@magazines.find {|e| e.name == "Modern Drummer"}
    #   magazine = DrummingNews::Magazine.create("Modern Drummer")
    #   @magazines << magazine
    # end
    ###Scrape articles
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      article.magazine = magazine #Assign modern drummer object to the article
      list << article
    end

    list
  end

  def scrape_drum
    list = []
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      list << article
    end
    list
  end

  def scrape_classic_drummer
    list = []
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      list << article
    end
    list
  end

  def scrape_ip
    list = []
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      list << article
    end
    list
  end
end