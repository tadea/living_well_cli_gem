class LivingWell::Scraper

   def self.scrape_articles

    doc = Nokogiri::HTML(open("https://www.bodybuilding.com/category/nutrition"))
    articles = doc.search(".cms-article-list--article")

      articles.each do |d|
       article = LivingWell::Article.new

        article.title = d.search("h3.title").text
        article.description = d.search("span.description").text
        article.date = d.search("span.date").text.strip.split(" ").slice(0, 3).join(" ")
        article.url =d.search("a[href]").first.attributes["href"].value

      article 
    end
  end


  def self.read_articles(url)
  
    scrape_url = url
    doc = Nokogiri::HTML(open(scrape_url))
    article_body = doc.search(".BBCMS__content--article-content p")

      article_body.each do |paragraph|
       puts ""
       puts Rainbow("#{paragraph.text.strip}").italic
      end

   end

end