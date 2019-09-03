

#Menu

require "date"
require "geocoder"
require "tty-prompt"

loop do 
    puts '1. Search for a hike'
    puts '2. Enter a hike'

    action = gets.chomp.to_i


    case action 
    when 1 
        prompt = TTY::Prompt.new
        choices = %w(Hike-name Hike-distance Distance-from-Melbourne Wheel-chair-friendly Dog-friendly)
        prompt.multi_select("What would you like to search by?", choices)

        if choices == "Hike-name"
            
        end 
     
    end 


    case action
    when 2
        prompt = TTY::Prompt.new
        prompt.yes?('Please confirm you would like to enter a hike') do |q|
            q.suffix 'Y/N'
          end
    end 

end 