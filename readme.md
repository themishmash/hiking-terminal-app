# Software Development Plan - We Can Walk It Out
By Michelle Wong 

## GitHub link
[Michelle's github link](https://github.com/themishmash/hiking-terminal-app)


## Presentation slides
[Michelle's pitch slides](https://docs.google.com/presentation/d/1LqawS4_onpdZeQiJMNyZ7WvtcBdottUUH0Jlgui5twc/edit#slide=id.p)

This plan will include the following:
* Statement of purpose and scope
* Features
* User interaction and Experience
* Control Flow Diagram
* Implementation Plan
* Status updates - Please refer to my [development-log.md](development-log.md)
* Help file
* Test application
* Future Improvements


## Statement of Purpose and Scope
### What the app will do - Feature: search by hikes

‘We can walk it out’ uses loop and case statements to provide people with information about hikes and to enter a hike. When users are first confronted with the app, there are three choices, ‘1. search by hike, 2. enter a hike and 3. exit.’ Users can only pick 1, 2 or 3. An else statement was used to achieve this. 

Data about the hikes are stored in a CSV file and a method was created to convert the CSV file into a hash in order to have a more aesthetically appealing display for the user. When users are searching hikes by name, distance from Melbourne etc, specific methods are being called upon in order to display the information as a hash. For example, when a user requests to list hikes by ‘Hike distance’, two methods are being called upon. The first one, ‘show_hike_dist(hiking_data)’ looks at hiking distance data from the CSV file and also uses a block to sort the data from shortest to longest. Then the user can choose which hike to look at specifically, calling on the method ‘hike_shown(hiking_data)’. 

### What the app will do - Feature: enter new hikes

Users also have the ability to enter new hikes. This is achieved by asking them a series of questions, with their answers stored into an array of hashes. This hash is then converted into a CSV and pushed into a CSV file containing all the hikes. The wheelchair and dog friendly questions are created as boolean data type questions and as a result, the user can only input ‘Y’ or ‘N’ to those questions. 


### Problem and why I’m developing it

This app aims to encourage people to take part in the great outdoors by providing quick and easy information to a multitude of hikes and also provide information to those with special needs (such as those who may be wheelchair bound) and those who wish to hike with dogs, about how they can participate as there is currently limited information on this. 

### Targeted audience

‘We can walk it out’ is targeted to those who are new and those who are seasoned hikers. People have two ways of interacting with the app. They can search the database of hikes listed by users of the app, searching by location, distance of the hike, distance from Melbourne and whether it is wheelchair friendly or dog friendly. The second way users can interact with the app is by contributing to the list of hikes. Users can list hikes after they have completed them by answering a series of questions related to how they can search by hikes - so the hike name, distance from Melbourne, whether it is wheelchair friendly or dog friendly. 


## List of features

Users are presented with a main menu with three options: Search for a hike, Enter a hike and Exit. This is a loop function. 

### Search for a hike

Within this option, users can list hikes by name, distance, distance from Melbourne, place name and whether the hike is wheelchair or dog friendly. 

If users click on the hike name feature, all hike names will be displayed. Users can then choose a specific hike to find out full details about it (ie the name, distance, distance from Melbourne, place name and whether it is wheelchair or dog friendly). 

If users click on the hike distance feature, all hikes will be displayed with with their distance, listed from shortest to longest distance. Like above, users can then choose a specific hike to find out full details about it. 

If users click on the distance from Melbourne feature, all hikes will be displayed with their distance from Melbourne, listed from closest to furtherest away from Melbourne. Like above, users can then choose a specific hike to find out full details about it.

If users click on the place name feature, all places will be displayed. Like above, users can then choose a specific hike to find out full details about it.

If users click on the wheelchair friendly feature, only hike names that are wheelchair friendly will be displayed. Like above, users can then choose a specific hike to find out full details about it.

If users click on the dog friendly feature, only hike names that are dog friendly will be displayed. Like above, users can then choose a specific hike to find out full details about it.

These features are all if statements that retrieve data from the CSV file 'hiking.csv'. This retrieval of the CSV data has been stored as a variable that has global scope. In addition, where a specific hike is presented to the user ('hike_shown' method), this was created as a method which is called upon each time as this made the code cleaner. 

In terms of error handling to do with the main menu, users cannot select something other than 1, 2, or 3 (corresonding with Search for a hike, Enter a hike and Exit). This was created with an if statement whereby if they enter a something other than those numbers, they will be asekd to choose again. 


### Enter a hike
If users click on this, they will be presented with a series of questions that align with the headers of the CSV file. They enter their answers which are then stored in an array of hashes. This array of hashes are then pushed into the hiking CSV file. 

In terms of error handling, I used a begin and rescue for the entering of wheelchair and dog friendly data. Users can only input Y or N for these questions (a boolean data type). I understand this is not usually how begin and rescue would be used (it is normally used for unexpected errors), however I am using it for the purposes of showing I can use this error handling approach. 

## User Interaction and Experience 

### How the user will find out how to interact with / use each feature
Users will be presented with the menu after they initiate the Ruby run file. The app requires the following ruby gems to be installed: 
* colorize
* tty-prompt
* tty-font
* tty-spinner

They then need to follow the options they are presented with. Please see image below:
![alt text](menu-screenshot.png)

### How the user will interact with / use each feature
Users have two main ways to interact with the features of this app. The first way is to select the menu option to search for a hike. 

They are then presented with sub-features where they can search for hikes by:
* hike names
* distance of hikes
* distance from Melbourne 
* place of the hike
* hikes that are wheelchair friendly
* hikes that are dog friendly.

![alt text](search-for-hike-screenshot.png)

Users can also enter hikes after being asked the following questions:
* What is the hike name?
* What is the hiking distance?
* What is the distance from Melbourne?
* Where is the hike located?
* Is it wheelchair friendly?
* Is it dog friendly?

Users also have the option to Exit from the app after searching or entering a hike. 

### How errors will be handled by the application and displayed to the user
Currently, errors will be handled in the following way:
* Automated testing. Please refer to the file titled 'automated_test_for_hike.rb'

* Manual testing. This is the link to the manual testing in detail [Google sheet](https://docs.google.com/spreadsheets/d/194DTAsyTxVmcwEmlERnpcEnefffcY9tf8t00JSTrAQk/edit#gid=883346421)

Please see screenshots below. 

![alt text](automated-testing-pass.png)

![alt text](manual-testing.png)


## Control Flow Diagram

![alt text](control-flow-diagram.png)

This is an overview of the whole app and then I have provided one example of error handling. 

This is the link to it as well. [Google drawing](https://docs.google.com/drawings/d/1xEXncdFXGSM4nKsnyBaKTQiBR3XKe9q7PFlLHQI_9ok/edit)

## Implementation Plan 

I utilised the tool Trello as a project management tool to assist in completing my terminal app. Please see the screen shots below of the board at different stages. I have also incldued a checklist. 

3-9-19 screenshot
![alt text](/trello/3-9-19-Trello-screenshot.png)

4-9-19 screenshot
![alt text](/trello/4-9-19-Trello-screenshot.png)

5-9-19 screenshot 2
![alt text](/trello/5-9-19-Trello-checklist-after-testing.png)

Trello checklist
![alt text](/trello/trello-checklist.png)

For most up to date version of my Trello booard, please see here [Hiking Terminal app Trello Board](https://trello.com/b/ATZqio7J/hiking-terminal-app)


## Help File

### Steps to install application / dependencies / hardware requirements
To run the app, follow the steps below. 

For Mac Users:
1. Have Homebrew installed 

2. Make sure Ruby is installed on the machine. I used rbenv and this required homebrew. I also used Ruby 2.5.1 

3. Clone the repo
````txt
git clone git@github.com:themishmash/hiking-terminal-app.git
````

4. 'cd' into the directory you've cloned

5. Run the build shell script
```txt
bash build.sh
````

6. Run the following command.
````txt 
ruby run.rb
````

7. If you want to start the app in advanced mode - ruby app.rb -a


### Different features of the application

Users are presented with a main menu with three options: Search for a hike, Enter a hike and Exit. This is a loop function. 

### Search for a hike

Within this option, users can list hikes by name, distance, distance from Melbourne, place name and whether the hike is wheelchair or dog friendly. 

For example, if users click on the hike name feature, all hike names will be displayed. Users can then choose a specific hike to find out full details about it (ie the name, distance, distance from Melbourne, place name and whether it is wheelchair or dog friendly).  

### Enter a hike
If users click on this, they will be presented with a series of questions that align with the headers of the CSV file. They enter their answers which are then stored in an array of hashes. This array of hashes are then pushed into the hiking CSV file. 

Please refer to the list of features in [Statement of purpose and scope; List of features](#list-of-features) above for more detailed information. 


## Test application

As mentioned above, testing will be handled in two ways:

* Automated testing. The following code shows that there are two automated tests being carried out. 
    * Test Number 1 calls an argument to determine whether the new hikes entered by the user are accurately entered into the CSV document. 
    * Test Number 2 calls an argument to determine whether the correct file exists. 

````
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
````

* Manual testing. This is the link to the manual testing in detail. [Google sheet](https://docs.google.com/spreadsheets/d/194DTAsyTxVmcwEmlERnpcEnefffcY9tf8t00JSTrAQk/edit#gid=883346421)


For more information, please refer to how errors are handled in [User Interaction and Experience](#How-errors-will-be-handled-by-the-application-and-displayed-to-the-user)


## Future Improvements

There are a few areas where this app could be improved.

* Ability to verify user input of hikes. Perhaps a user name and login. 
* Ability to verify names of the hikes and places. Currently the user can enter in anything that is a string and it will be saved into the hike database. 
* I had hoped to use the geocoder gem to calculate the distance between the hike and Melbourne by getting the user to input the place. However, I realised that working out distance between objects can only be achieved through Rails. As a result, unfortunately this could not be implemented. 
* After speaking to some people with special needs (who I volunteer with), they mentioned that it would be great to have information about whether the hikes are accessible via public transport. Subsequently, I would like to find out if there is an API or gem that I can use to help gather information about this instead of just getting the user to input this information. 









