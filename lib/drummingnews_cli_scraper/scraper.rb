class DrummingNews::Scraper
  attr_accessor :magazines 

  def self.scrape_md
    html = open("https://www.moderndrummer.com/")
    doc = Nokogiri::HTML(html)
    doc.css("div.article").first(10).each do |scrape|
      article = DrummingNews::Article.new
      article.title = scrape.css("a.inline-link").text
      article.url = scrape.css("a.inline-link").attribute("href").value
      article.magazine = Modern_drummer
      Modern_drummer.articles << article
    end
  end

  def self.scrape_drum
    html = open("http://drummagazine.com/news/")
    doc = Nokogiri::HTML(html)
    doc.css("h2.cb-post-title").each do |scrape|
      article = DrummingNews::Article.new
      article.title = scrape.text
      article.url = scrape.css("a").attribute("href").value
      article.magazine = DRUM
      DRUM.articles << article
    end
  end

  def self.scrape_rhythm
    html = open("http://www.musicradar.com/rhythm")
    doc = Nokogiri::HTML(html)
    doc.css(".feature-block a").each do |scrape| #Scrapes header titles
      article = DrummingNews::Article.new
      article.title = scrape.css("span.article-name").text
      article.url = scrape.attribute("href").value
      article.magazine = Rhythm
      Rhythm.articles << article
    end
    doc.css(".listingResult").first(7).each do |scrape| #Scrapes the rest
      article = DrummingNews::Article.new
      article.title = scrape.css("h3").text
      article.url = scrape.css("a").attribute("href")
      article.magazine = Rhythm
      # binding.pry
      Rhythm.articles << article
    end
  end

  def self.scrape_article(url, current_magazine, article_choice) 
    if current_magazine == Modern_drummer #Set up scraping for different magazines
      scrape_css = ".entry-content p"
    elsif current_magazine == DRUM
      scrape_css = ".cb-itemprop p"
    elsif current_magazine == Rhythm
      article_choice <= 3 ? scrape_css = ".gallery-text p" : scrape_css = ".text-copy p"
    end
    article = ""
    html = open(url)
    doc = Nokogiri::HTML(html) 
    doc.css(scrape_css).each do |p|   
      article += p.text
      article += "\n\n"
    end
    article += "------------------------------------------\n\n"
    article
    
  end

  

end