<strong>What the app will do - search by hikes</strong>

‘We can walk it out’ use a loop and case statements to provide people with information about hikes and to enter a hike. When users are first confronted with the app, there are three choices, ‘1. search by hike, 2. enter a hike and 3. exit.’ At the moment, users can only pick 1, 2 or 3. An else statement was used to achieve this. 

Data about the hikes are stored in a CSV file and a method was created to convert the CSV file into a hash in order to have a more aesthetically appealing display for the user. When users are searching hikes by name, distance from Melbourne etc, specific methods are being called upon in order to display the information as a hash. For example, when a user requests to list hikes by ‘Hike distance’, two methods are being called upon. The first one, ‘show_hike_dist(hiking_data)’ looks at hiking distance data from the CSV file and also uses a block to sort the data from shortest to longest. Then the user can choose which hike to look at specifically, calling on the method ‘hike_shown(hiking_data)’. 

<strong>What the app will do - enter new hikes</strong>

Users also have the ability to enter new hikes. This is achieved by asking them a series of questions, with their answers stored into an array of hashes. This hash is then converted into a CSV and pushed into a CSV file containing all the hikes. The wheelchair and dog friendly questions are created as boolean data type questions and as a result, the user can only input ‘Y’ or ‘N’ to those questions. 


<strong>Problem and why I’m developing it</strong>

This app aims to encourage people to take part in the great outdoors by providing quick and easy information to a multitude of hikes and also provide information to those with special needs (such as those who may be wheelchair bound) and those who wish to hike with dogs, about how they can participate as there is currently limited information on this. 

<strong>Targeted audience</strong>

‘We can walk it out’ is targeted to those who are new and those who are seasoned hikers. People have two ways of interacting with the app. They can search the database of hikes listed by users of the app, searching by location, distance of the hike, distance from Melbourne and whether it is wheelchair friendly or dog friendly. The second way users can interact with the app is by contributing to the list of hikes. Users can list hikes after they have completed them by answering a series of questions related to how they can search by hikes - so the hike name, distance from Melbourne, whether it is wheelchair friendly or dog friendly. 


