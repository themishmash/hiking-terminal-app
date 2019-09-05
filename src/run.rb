require_relative "hike.rb"

#############################START APP############################
    
font = TTY::Font.new(:doom)
puts font.write("Walk It")

########ARGV######## (had to change every gets and put STDIN in front)
name = ""
def get_name_hike
    return hike_name = ARGV[0]
end 

hike_name = get_name_hike
#puts hike_name

hiking_data = []
hiking_data = load_data_from_csv("hiking.csv", hiking_data)

loop do 
    puts '1. Search for a hike'.colorize(:green)
    puts '2. Enter a hike'.colorize(:blue)
    puts '3. Exit'.colorize(:red)

    action = STDIN.gets.chomp.to_i


    case action 
        when 1 
            file_exist = File.exist?('hiking.csv')
            if file_exist == false
                puts 'Error: Sorry this info is not available now. Please let the administrator know. Please select another option.'
            
            else

            prompt = TTY::Prompt.new
            action = prompt.select('What would you like to list by') do |menu|
                menu.choice 'Hike name', 'name'
                menu.choice 'Hike distance', 'distance'
                menu.choice 'Distance from Melbourne', 'distance_from_melb'
                menu.choice 'Place name', 'place'
                menu.choice 'Wheelchair friendly', 'wheelchair'
                menu.choice 'Dog friendly', 'dog'
            end
        

            if action == 'name'   
                system 'clear'
                puts "Which hike would you like information on?"
                show_hike_names(hiking_data)
                hike_shown(hiking_data) #see argument up the top now in accordance with DRY
                
            end

            if action == 'distance'
                system 'clear'
                puts "Which hike would you like information on? You can do it - there are short hikes!"
                show_hike_dist(hiking_data)
                hike_shown(hiking_data)
                
            end 
            
            if action == 'distance_from_melb'
                system 'clear'
                puts "Which hike would you like information on? Don't worry, some hikes are really close to Melbourne!"
                show_dist_from_melb(hiking_data)
                hike_shown(hiking_data)
                
            end 

            if action == 'place'
                system 'clear'
                puts "Which hike would you like information on?"
                show_place(hiking_data)
                hike_shown(hiking_data)
            end 


            if action == 'wheelchair'
                system 'clear'
                puts "Which hike would you like more information on?"
                show_wheelchair(hiking_data)
                hike_shown(hiking_data)
                
            end 

           
            if action == 'dog'
                system 'clear'
                puts "Which hike would you like more information on?"
                show_dogs(hiking_data)
                hike_shown(hiking_data)
                
            end 
    
        end 

        when 2 #enter hike. 
            prompt = TTY::Prompt.new
            hikes = prompt.ask("What is the name of the hike?") 
            distance = prompt.ask("What is the hiking distance? (km)").to_f   
            distance_from_melbourne = prompt.ask("What is the distance from Melbourne? (km)").to_f
            place = prompt.ask("Where is the hike located?")

                # rescue 1
            wheelchair = ""
                loop do
                    begin
                        wheelchair1 = prompt.yes?("Is it wheelchair friendly?")
                        if wheelchair1 == true
                            wheelchair = "Y"
                        else wheelchair = "N"
                        end 
                        break 
                    rescue => error
                        puts "Please choose Y or N"
                    end
                end

                
                ### rescue 2
            dog = ""
                loop do  
                    begin   
                        dog1 = prompt.yes?("Is it dog friendly?")
                        if dog1 == true
                            dog = "Y"
                        else dog = "N"
                        end 
                        break
                    rescue => error
                        puts "Please choose Y or N"
                    end     
                end 
                ### rescue
                add_hike(hikes, distance, distance_from_melbourne, place, wheelchair, dog)

        when 3
            puts "Take a hike!"
            puts `say "Take a hike!"`
            exit 
        else 
            system 'clear'
            puts 'Invalid selection. Please choose again'
     end
end
