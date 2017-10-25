class DrummingNews::Scraper
  attr_accessor :magazines

  def scrape_titles ##### get titles   
    scrape(Modern_drummer)
    scrape(DRUM)
    scrape(Innovative_percussion)
    scrape(Classic_drummer)
  end

  def scrape(magazine_name) ##Keeps adding articles that are already created
    10.times do
      article = DrummingNews::Article.new
      article.title = "Cool article"
      article.author = "Writer Guy"
      article.date = "12-22-2017"
      article.magazine = magazine_name
      magazine_name.articles <<  article
    end
  end 
end