class EatingWell::Scraper

   def self.scrape_articles
    doc = Nokogiri::HTML(open("https://www.bodybuilding.com/category/nutrition"))
    articles = doc.search(".cms-article-list--article")

      articles.each do |d|
        article = EatingWell::Article.new
        article.title = d.search("h3.title").text
        article.description = d.search("span.description").text
        article.date = d.search("span.date").text.strip.split(" ").slice(0, 3).join(" ")
        article.url =d.search("a[href]").first.attributes["href"].value
             #article.content = self.article_content(article_url)
             #article = EatingWell::Article.new(article_title,article_date, article_content, article_url)
        article 
  end
  
end