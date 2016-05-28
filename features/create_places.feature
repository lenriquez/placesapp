Feature: Create Places 
	I would like to create Places using the API

	Scenario: The API should return a 400 error if the url does not contain the right paramenters
	When the client request POST api/v1/places with the following 

	#Scenario: The API should the message "Your information has been save"
	#When the client request POST api/v1/places with the following { name: "Cali", geo: [1,2], raiting: "bueno",review: "This is a test creating a place using the API"]} 