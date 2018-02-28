class EatingWell::Article
   attr_accessor :title, :date, :content, :url, :description

  @@all_articles = []

  def initialize
    @@all_articles << self
  end


  def self.all
    @@all_articles
  end

  def self.valid_input?(num)
    num.to_i > 0 && num.to_i <= EatingWell::Article.all.size
  end

  def self.find(index)
    @@all_articles[index.to_i - 1]
  end
  
end