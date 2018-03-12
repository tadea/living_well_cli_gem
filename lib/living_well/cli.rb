#CLI Controller

class LivingWell::CLI

 def call
 	 LivingWell::Scraper.scrape_articles
   puts ""
   puts Rainbow("Welcome to Living Well").red.bold.italic.bg(:silver).underline
   puts " "
   menu
   puts Rainbow("---------------------------").bold.red
   user_input
   goodbye 
 end

 def menu
  puts Rainbow("---------Main Menu---------").bold.red
  puts Rainbow("1. Nutrition Articles").black.bold
  puts Rainbow("2. Exit").black.bold
  puts Rainbow("---------------------------").bold.red
 end

 def user_input
    input = 'nil'
     while input
     puts""
     puts Rainbow(">>Enter '1' to list articles or enter '2' to exit<<").underline
     input = gets.strip.downcase

     case input
     when "1"
       list_articles
     when "2"
       goodbye
       exit 
     else
      puts "---------------------------"
      puts Rainbow("Wrong input, try again!").red.bold.italic.bg(:silver).blink
      puts "---------------------------"
      menu
     end
    end
  end

 def list_articles
    LivingWell::Article.all.each.with_index(1) do |article,i|
    puts Rainbow("#{i}. #{article.title}").italic.bold
    puts " "
   end
    read_articles
 end

 def read_articles
  input = " "
  puts Rainbow(">>Enter the number of the article you would love to read<<").underline
  input = gets.strip

      if LivingWell::Article.valid_input?(input)
        article = LivingWell::Article.find(input)
        
         puts "#{article.title}" 
         puts  "#{article.date}"
         puts ""
         url = article.url         
         LivingWell::Scraper.read_articles(url)  
         elsif input == "exit" 
         menu 
         else
          puts Rainbow("Wrong input, try again!").red.bold.italic.bg(:silver).blink
         read_articles
   

    end
 end

 def goodbye
	puts "Thank you for using my cli gem, have a good day!"
 end

end




