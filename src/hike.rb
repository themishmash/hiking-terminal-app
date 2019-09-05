
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

###distance of hikes - sort by shortest to longest using block
def show_hike_dist(hiking_data)
    hiking_data.sort! {|a,b| a['Distance'].to_f <=> b['Distance'].to_f} #block from Jack
    hiking_data.each_with_index do |hike, index|
       puts "#{index + 1}- #{hike["Hike"]} #{hike["Distance"]}" 
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
    wheelchair_result = hiking_data.select! {|data| data["Wheelchair?"] == 'Y'} 
    wheelchair_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]} #{hike["Wheelchair?"]}" 
    end 
end 


#####dogs - sort by yes#######
def show_dogs(hiking_data)
    dog_result = hiking_data.select! {|data| data["Dogs?"] == 'Y'}
    dog_result.each_with_index do |hike, index|
        puts "#{index + 1}- #{hike["Hike"]} #{hike["Dogs?"]}" 
    end 
end 




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

def add_hike(hikes, distance, distance_from_melbourne, place, wheelchair, dog)
    # hiking_list = [] #array    
    hike = {
        Hikes: hikes,
        Distance: distance,
        Distance_From_Melbourne: distance_from_melbourne,
        Place: place,
        Wheelchair?: wheelchair,
        Dog?: dog
    }

    # hiking_list << (hike)

    CSV.open('hiking.csv', 'a') do |csv|
        csv  << hike.values
    end 

    spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
    spinner.auto_spin # Automatic animation with default interval
    sleep(2) # Perform task
    spinner.stop('Done!') # Stop animation
    puts "Your hike has been added! Remember, those boots are made for walking!"
end

#hike_shown(hiking_data)
#show_hike_names(hiking_data)
#hiking_data
#show_hike_dist(hiking_data)]
#show_dist_from_melb(hiking_data)
#show_wheelchair(hiking_data)
#show_dogs(hiking_data)
