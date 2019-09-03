

#Menu

require "date"
require "geocoder"
require "tty-prompt"
require "csv"
require "tty-table"

require "pry"



loop do 
    puts '1. Search for a hike'
    puts '2. Enter a hike'

    action = gets.chomp.to_i


    case action 
    when 1 
    
        prompt = TTY::Prompt.new

        action = prompt.select('What would you like to search by') do |menu|
            menu.choice 'Hike name', 1
            menu.choice 'Hike distance', 2
            menu.choice 'Distance from Melbourne', 3
            menu.choice 'Wheel chair friendly', 4
            menu.choice 'Dog friendly', 5
        end
        

        #menu 1, option 1
        case action
        when 1
            arr_headers = []
            hike_values = []
            
            
          File.open("hiking.csv", 'r').each_with_index do |line, index|
                if line.length > 0
                    if index == 0
                    arr_headers << line
                    else 
                        hike_values << line
                    end 
                end 
            end

            

            p arr_headers
            p hike_values
    

            



        end 

        
        break #to break out of initial menu



        

        case action 
        when 2
        end 

        case action 
        when 3

        end 


        case action

        when 4

        end 



        case action
        when 5

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


#classes

# class Hike
#     def initialize(hike_name, hike_dist, dist_melb, wheelchair, dog_friend)
#         @hike_name = hike_name
#         @hike_dist = hike_dist
#         @dist_melb  = dist_melb
#         @wheelchair = wheelchair
#         @dog_friend = dog_friend

#     end 

#     def @hiking_name

#     end 

# end 