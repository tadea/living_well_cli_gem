#CLI Controller
class LivingWell::CLI

 def call
   puts "Welcome to Living Well"
   puts " "
   menu
   puts "-------------------------"
   user_input
   goodbye 
 end

 def menu
  puts "---------Main Menu---------"
  puts "1. Nutrition Articles"
  puts "2. Exit"
  puts "---------------------------"
 end

 def user_input
    input = 'nil'
    while input
    puts "Enter '1' to see articles or enter '2' to exit:"
    input = gets.strip.downcase

     case input
     when "1"
    list_articles
    when "2"
    goodbye
    exit 
    else
    puts "---------------------------"
    puts "Wrong input, try again!"
    menu
    end
   end
 end

 def list_articles
    EatingWell::Article.all.each.with_index(1) do |article,i|
    puts "#{i}. #{article.title}"
    puts " "
   end
    read_articles
 end

 def read_articles
  input = " "
  puts "Enter the number of the article you would love to read:"
  end 
 end



end