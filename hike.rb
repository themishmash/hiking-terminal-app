

#Menu

require "date"
require "geocoder"
require "tty-prompt"
require "csv"
require "tty-table"

require "pry"

#convert the csv to hash row.to_h
def load_data_from_csv(filename, data_array)
    csv_file = CSV.read("#{filename}", headers: true)
    
    csv_file.each do |row|
        data_array << row.to_h
    end
    return data_array
end

####hiking names
def show_hike_names(hiking_data)
    # Need to check why name isnt working
    hiking_data.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Place"]}"
    end
end

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
        puts "#{index + 1}- #{hike["Place"]} #{hike["Distance_From_Melbourne"]}"
    end 
end 


###### wheelchair - sort by yes
def show_wheelchair(hiking_data)
    #how to get if y
    wheelchair_result = hiking_data.select! {|data| data["Wheelchair?"] == 'Y'} #how to get if data = Y

    wheelchair_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Place"]} #{hike["Wheelchair?"]}" 
    end 
end 


#####dogs - sort by yes
def show_dogs(hiking_data)
    dog_result = hiking_data.select! {|data| data["Dogs?"] == 'Y'}
    dog_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Place"]} #{hike["Dogs?"]}" 
    end 
end 

hiking_data = []
hiking_data = load_data_from_csv("hiking.csv", hiking_data)




######print hike method so DRY
def hike_shown(hiking_data)
    puts "Select the number of hike you'd like more info on"
    input_number = gets.chomp.to_i - 1
    selected_hike = hiking_data[input_number]
    
    puts "Name: #{selected_hike["Place"]}"
    puts "Distance(km): #{selected_hike["Distance"]}"
    puts "Distance from Melbourne(km): #{selected_hike["Distance_From_Melbourne"]}"
    puts "Wheelchair friendly?: #{selected_hike["Wheelchair?"]}"
    puts "Dog friendly?: #{selected_hike["Dogs?"]}"
    
end 

#hike_shown(hiking_data)




#show_hike_names(hiking_data)


# hiking_data
#hiking_data

#show_hike_dist(hiking_data)

#show_dist_from_melb(hiking_data)

#show_wheelchair(hiking_data)

#show_dogs(hiking_data)
    
    
####### user can search by hike name, distance of hike, distance from melb, wheelchair or dog friendly
loop do 
    puts '1. Search for a hike'
    puts '2. Enter a hike'
    puts '3. Exit'

    action = gets.chomp.to_i


    case action 
        when 1 
            prompt = TTY::Prompt.new

            action = prompt.select('What would you like to list by') do |menu|
                menu.choice 'Hike name', 'name'
                menu.choice 'Hike distance', 'distance'
                menu.choice 'Distance from Melbourne', 'distance_from_melb'
                menu.choice 'Wheelchair friendly', 'wheelchair'
                menu.choice 'Dog friendly', 'dog'
            end

            if action == 'name'   #how to sort by alphabetical?
                system 'clear'
                puts "Which hike would you like information on?"
                show_hike_names(hiking_data)
                hike_shown(hiking_data) #see argument up the top now in accordance with DRY
                
                ####put this into method so less repetition!!!!!
                # puts "Select the number of hike you'd like more info on"
                # input_number = gets.chomp.to_i - 1
                # system 'clear'
                # selected_hike = hiking_data[input_number]
                # puts "Name: #{selected_hike["Place"]}"
                # puts "Distance(km): #{selected_hike["Distance"]}"
                # puts "Distance from Melbourne(km): #{selected_hike    ["Distance_From_Melbourne"]}"
                # puts "Wheelchair friendly?: #{selected_hike["Wheelchair?"]}"
                # puts "Dog friendly?: #{selected_hike["Dogs?"]}"
            

                break 
            end

            if action == 'distance'
                system 'clear'
                puts "Which hike would you like information on? You can do it - there are short hikes!"
                show_hike_dist(hiking_data)
                hike_shown(hiking_data)
                ####DRY
                # puts "Select the number of hike you'd like more info on"
                # input_number = gets.chomp.to_i - 1
                # system 'clear'
                # selected_hike = hiking_data[input_number]
                # puts "Name: #{selected_hike["Place"]}"
                # puts "Distance(km): #{selected_hike["Distance"]}"
                # puts "Distance from Melbourne(km): #{selected_hike    ["Distance_From_Melbourne"]}"
                # puts "Wheelchair friendly?: #{selected_hike["WheelChair?"]}"
                # puts "Dog friendly?: #{selected_hike["Dogs?"]}"

                break 
            end 
            
            if action == 'distance_from_melb'
                system 'clear'
                puts "Which hike would you like information on? Don't worry, some hikes are really close to Melbourne!"
                show_dist_from_melb(hiking_data)
                hike_shown(hiking_data)

                # puts "Select the number of the hike you'd like more info on"
                # input_number = gets.chomp.to_i - 1
                # system 'clear'
                # selected_hike = hiking_data[input_number]
                # puts "Name: #{selected_hike["Place"]}"
                # puts "Distance(km): #{selected_hike["Distance"]}"
                # puts "Distance from Melbourne(km): #{selected_hike    ["Distance_From_Melbourne"]}"
                # puts "Wheelchair friendly?: #{selected_hike["WheelChair?"]}"
                # puts "Dog friendly?: #{selected_hike["Dogs?"]}"


                break
            end 


            
            if action == 'wheelchair'
                system 'clear'
                puts "Which hike would you like more information on?"
                show_wheelchair(hiking_data)
                hike_shown(hiking_data)

                # puts "Select the number of the hike you'd like more info on"
                # input_number = gets.chomp.to_i - 1   
                # system 'clear'
                # selected_hike = hiking_data[input_number]
                # puts "Name: #{selected_hike["Place"]}"
                # puts "Distance(km): #{selected_hike["Distance"]}"
                # puts "Distance from Melbourne(km): #{selected_hike    ["Distance_From_Melbourne"]}"
                # puts "Wheelchair friendly?: #{selected_hike["WheelChair?"]}"
                # puts "Dog friendly?: #{selected_hike["Dogs?"]}"

                break

            end 



           
            if action == 'dog'
                system 'clear'
                puts "Which hike would you like more information on?"
                show_dogs(hiking_data)
                hike_shown(hiking_data)

                # puts "Select the number of the hike you'd like more info on"
                # input_number = gets.chomp.to_i - 1   
                # system 'clear'
                # selected_hike = hiking_data[input_number]
                # puts "Name: #{selected_hike["Place"]}"
                # puts "Distance(km): #{selected_hike["Distance"]}"
                # puts "Distance from Melbourne(km): #{selected_hike    ["Distance_From_Melbourne"]}"
                # puts "Wheelchair friendly?: #{selected_hike["WheelChair?"]}"
                # puts "Dog friendly?: #{selected_hike["Dogs?"]}"

                break
            end 
    


        when 2

        


        when 3
            puts "Take a hike!"
            
            exit 

        else 
            system 'clear'
            puts 'Invalid selection. Please choose again'
            
     end
end

        












# loop do 
#     puts '1. Search for a hike'
#     puts '2. Enter a hike'

#     action = gets.chomp.to_i


#     case action 
#     when 1 
    
#         prompt = TTY::Prompt.new

#         action = prompt.select('What would you like to search by') do |menu|
#             menu.choice 'Hike name', 1
#             menu.choice 'Hike distance', 2
#             menu.choice 'Distance from Melbourne', 3
#             menu.choice 'Wheel chair friendly', 4
#             menu.choice 'Dog friendly', 5
#         end
        

#         #menu 1, option 1
#         case action
#         when 1
#             arr_headers = []
#             hike_values = []
            
            
#           File.open("hiking.csv", 'r').each_with_index do |line, index|
#                 if line.length > 0
#                     if index == 0
#                     arr_headers << line
#                     else 
#                         hike_values << line
#                     end 
#                 end 
#             end



#             p arr_headers
#             p hike_values
    

            



#         end 

        
#         break #to break out of initial menu



        

#         case action 
#         when 2
#         end 

#         case action 
#         when 3

#         end 


#         case action

#         when 4

#         end 



#         case action
#         when 5

#         end 
     
     
#     end 


    
    
    
#     case action
#     when 2
#         prompt = TTY::Prompt.new
#         prompt.yes?('Please confirm you would like to enter a hike') do |q|
#             q.suffix 'Y/N'
#         end
#     end 

# end 


# #classes

# class Hike

#     def initialize(hike_name, hike_dist, dist_melb, wheelchair, dog)
#         @hike_name = hike_name
#         @hike_dist = hike_dist
#         @dist_melb  = dist_melb
#         @wheelchair = wheelchair
#         @dog_friend = dog

#     end 

#     def @hiking_name

#     end 

# end 