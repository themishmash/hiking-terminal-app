require_relative "hike.rb"
hiking_list = [] 


# Test Number 1
def check_add_hike
    csv = load_data_from_csv('hiking.csv', [])
    initial_length = csv.length
    add_hike("Test", "10", "20", "South Yarra", "Y", "N")
    csv = load_data_from_csv('hiking.csv', [])
    
    if csv.length - initial_length >= 1
        return "Test passes!".colorize(:green)
    else
        return "Test failed!".colorize(:red)
    end
end

# Test Number 2
def check_file_exists(filename)
    file_exist = File.exist?(filename)
    if file_exist == true
        return "Test passes!".colorize(:green)
    else 
        puts 'Error: Sorry this info is not available now. Please let the administrator know. Please select another option.'
        return "Test failed!".colorize(:red)
    end
end

puts check_file_exists('hiking.csv')
puts check_add_hike
