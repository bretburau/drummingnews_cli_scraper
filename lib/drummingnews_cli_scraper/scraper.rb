class DrummingNews::Scraper
  attr_accessor :magazines

  def scrape_titles ##### get titles   
    scrape(Modern_drummer)
    scrape(DRUM)
    scrape(Innovative_percussion)
    scrape(Classic_drummer)
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
    doc.css(".entry-content p").each do |p|
      article += p.text
      article += "\n\n"
    end
    article += "----------------------------------\n\n"
    article
  end

  def scrape_drum

  end

end