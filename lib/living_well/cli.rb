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

end