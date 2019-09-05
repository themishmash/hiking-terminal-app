# Software Development Plan - We can Walk It Out
By Michelle Wong

This plan will include the following:
* Statement of purpose and scope
* Features
* User interaction and Experience


## Statement of Purpose and Scope
### What the app will do - search by hikes

‘We can walk it out’ use a loop and case statements to provide people with information about hikes and to enter a hike. When users are first confronted with the app, there are three choices, ‘1. search by hike, 2. enter a hike and 3. exit.’ At the moment, users can only pick 1, 2 or 3. An else statement was used to achieve this. 

Data about the hikes are stored in a CSV file and a method was created to convert the CSV file into a hash in order to have a more aesthetically appealing display for the user. When users are searching hikes by name, distance from Melbourne etc, specific methods are being called upon in order to display the information as a hash. For example, when a user requests to list hikes by ‘Hike distance’, two methods are being called upon. The first one, ‘show_hike_dist(hiking_data)’ looks at hiking distance data from the CSV file and also uses a block to sort the data from shortest to longest. Then the user can choose which hike to look at specifically, calling on the method ‘hike_shown(hiking_data)’. 

### What the app will do - enter new hikes

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


