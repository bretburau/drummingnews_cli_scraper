class DrummingNews::Scraper
  attr_accessor :magazines

  def scrape_titles ##### get titles   
    scrape(Modern_drummer)
    scrape(DRUM)
    scrape(Innovative_percussion)
    scrape(Rhythm)
  end

  def scrape(magazine_name) ##Keeps adding dummy articles that are already created
    # 10.times do
    #   article = DrummingNews::Article.new
    #   article.title = "Cool article"
    #   article.author = "Writer Guy"
    #   article.date = "12-22-2017"
    #   article.magazine = magazine_name
    #   article.url = "https://internet.net"
    #   article.excerpt = "A breif description"
    #   magazine_name.articles <<  article
    # end
  end 

  def scrape_md
    html = open("https://www.moderndrummer.com/")
    doc = Nokogiri::HTML(html)
    doc.css("div.article").first(10).each do |scrape|
      article = DrummingNews::Article.new
      article.title = scrape.css("a.inline-link").text
      article.author = scrape.css("div.article-author").text
      article.url = scrape.css("a.inline-link").attribute("href").value
      # article.excerpt = scrape.css(".article-excerpt").text.strip   ###Don't think I'm gonna use this
      article.magazine = Modern_drummer
      Modern_drummer.articles << article
    end
  end

  def scrape_article(url) ###For MD right now...need to fix later
    article = ""
    html = open(url)
    doc = Nokogiri::HTML(html)
    ###return content as needed...hash or just the paragraph?
    
    # doc.css(".entry-content p").each do |p| ## For MD!!!!
    doc.css(".cb-itemprop p").each do |p|
      article += p.text
      article += "\n\n"
    end
    article += "----------------------------------\n\n"
    article
  end

  def scrape_drum
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

  def scrape_rhythm
    html = open("http://www.musicradar.com/rhythm")
    doc = Nokogiri::HTML(html)
    doc.css(".feature-block a").each do |scrape| #Scrapes header titles
      article = DrummingNews::Article.new
      article.title = scrape.css("span.article-name").text
      article.url = scrape.attribute("href").value
      article.magazine = Rhythm
      Rhythm.articles << article
    end
    doc.css(".listingResult").first(7).each do |scrape|
      article = DrummingNews::Article.new
      article.title = scrape.css("h3").text
      article.url = scrape.css("a").attribute("href")
      article.magazine = Rhythm
      Rhythm.articles << article
    end

    # doc.css(".feature-block a span.article-name")[0].text Title for first 3
    # doc.css(".feature-block a")[0].attribute("href").value #####Works in header for 3 articles

    # doc.css(".listingResult a").attribute("href") ###For next ones
    # doc.css(".listingResult h3").text

  end

end