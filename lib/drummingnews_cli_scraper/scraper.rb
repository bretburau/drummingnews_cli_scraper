class DrummingNews::Scraper
  attr_accessor :magazines
  def initialize
    @magazines = []
  end

  def modern_drummer
    list = []
    if !@magazines.find {|e| e.name == "Modern Drummer"}
      magazine = DrummingNews::Magazine.create("Modern Drummer")
      @magazines << magazine
    end
    ###Scrape articles
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      article.magazine = magazine #Assign modern drummer object to the article
      list << article
    end
    binding.pry
    list
  end

  def drum
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

  def classic_drummer
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

  def ip
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