
#########Main coding doc###############

require 'tty-prompt'
require 'colorize'
require 'tty-font'
require 'tty-spinner'

require 'CSV'
require 'pry'


#convert the csv to hash row.to_h
def load_data_from_csv(filename, data_array)
    csv_file = CSV.read("#{filename}", headers: true)
    csv_file.each do |row|
        data_array << row.to_h
    end
    return data_array
end

####hiking names  #how to sort by alphabetical? - MICHELLE
def show_hike_names(hiking_data)
    # Need to check why name isnt working
    hiking_data.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]}"
    end
end

####JACK alphabetical - not working as not matching index with it. 
# def show_hike_names(hiking_data)
#     data = hiking_data.map {|data| data["Place"]}
#     p data
#     data.sort! {|a,b| a.to_s <=> b.to_s}

#     # Need to check why name isnt working
#     data.each_with_index do |hike, index|
#         puts "#{index + 1}- #{hike}"
#     end
# end

###distance of hikes - sort by shortest to longest 
def show_hike_dist(hiking_data)
    hiking_data.sort! {|a,b| a['Distance'].to_f <=> b['Distance'].to_f} #block from Jack
    hiking_data.each_with_index do |hike, index|
       puts "#{index + 1}- #{hike["Place"]} #{hike["Distance"]}" 
    end 
end 


######distance from melb - sort by shortest to longest
def show_dist_from_melb(hiking_data)
    hiking_data.sort! {|a,b| a['Distance_From_Melbourne'].to_f <=> b['Distance_From_Melbourne'].to_f}
    hiking_data.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]} #{hike["Distance_From_Melbourne"]}"
    end 
end 


######place############
def show_place(hiking_data)
    hiking_data.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Place"]}"
    end 
end 


###### wheelchair - sort by yes
def show_wheelchair(hiking_data)
    #how to get if y
    wheelchair_result = hiking_data.select! {|data| data["Wheelchair?"] == 'Y'} #how to get if data = Y

    wheelchair_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]} #{hike["Wheelchair?"]}" 
    end 
end 


#####dogs - sort by yes
def show_dogs(hiking_data)
    dog_result = hiking_data.select! {|data| data["Dogs?"] == 'Y'}
    dog_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]} #{hike["Dogs?"]}" 
    end 
end 

hiking_data = []
hiking_data = load_data_from_csv("hiking.csv", hiking_data)


######print hike method so DRY. This used to be under each action
def hike_shown(hiking_data)
    puts "Select the number of hike you'd like more info on"
    input_number = STDIN.gets.chomp.to_i - 1
    selected_hike = hiking_data[input_number]
    
    puts "Name: #{selected_hike["Hike"]}"
    puts "Distance(km): #{selected_hike["Distance"]}"
    puts "Distance from Melbourne(km): #{selected_hike["Distance_From_Melbourne"]}"
    puts "Wheelchair friendly?: #{selected_hike["Wheelchair?"]}"
    puts "Dog friendly?: #{selected_hike["Dogs?"]}"
    
end 

#hike_shown(hiking_data)
#show_hike_names(hiking_data)
#hiking_data
#show_hike_dist(hiking_data)]
#show_dist_from_melb(hiking_data)
#show_wheelchair(hiking_data)
#show_dogs(hiking_data)



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

loop do 
    puts '1. Search for a hike'.colorize(:green)
    puts '2. Enter a hike'.colorize(:blue)
    puts '3. Exit'.colorize(:red)

    action = STDIN.gets.chomp.to_i


    case action 
        when 1 
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
                break 
            end

            if action == 'distance'
                system 'clear'
                puts "Which hike would you like information on? You can do it - there are short hikes!"
                show_hike_dist(hiking_data)
                hike_shown(hiking_data)
                break 
            end 
            
            if action == 'distance_from_melb'
                system 'clear'
                puts "Which hike would you like information on? Don't worry, some hikes are really close to Melbourne!"
                show_dist_from_melb(hiking_data)
                hike_shown(hiking_data)
                break
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
                break
            end 

           
            if action == 'dog'
                system 'clear'
                puts "Which hike would you like more information on?"
                show_dogs(hiking_data)
                hike_shown(hiking_data)
                break
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
            
            hiking_list = [] #array    
            hike = {
                Hikes: hikes,
                Distance: distance,
                Distance_From_Melbourne: distance_from_melbourne,
                Place: place,
                Wheelchair?: wheelchair,
                Dog?: dog
            }

            hiking_list << (hike)

            CSV.open('hiking.csv', 'a') do |csv|
                hiking_list.each do |hash|
                    csv << hash.values
                end 
            end 

            spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
            spinner.auto_spin # Automatic animation with default interval
            sleep(2) # Perform task
            spinner.stop('Done!') # Stop animation
            puts "Your hike has been added! Remember, those boots are made for walking!"
            
           #p hiking_list


        when 3
            puts "Take a hike!"
            puts `say "Take a hike!"`
            exit 
        else 
            system 'clear'
            puts 'Invalid selection. Please choose again'
     end
end
