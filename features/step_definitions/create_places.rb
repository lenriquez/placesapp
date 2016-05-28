When(/^the client request POST api\/v(\d+)\/places with the following \/v(\d+)\/$/) do |urn|
	`curl -X POST -d 'name=luis&location=[4.6799123,-74.0475429]&rating=rat&review=review' 'http://localhost:3000/api/v1/places'`
end

When(/^the clients request POST api\/v(\d+)\/places with the following \/v(\d+)\/$/) do |urn, param|
	puts urn
	puts parameters
	# Get HTTP object
	http = Net::HTTP.new("http://localhost", "3000")

	# Create Request
	request = Net::HTTP::Post.new(urn)
	request.add_field('Content-Type', 'application/json')
	request.body = parameters
	
	# Analise Response 
	response = http.request(request)
 	@last_response = get(encoded_url).body
end

#When(/^the client request POST (.*?) with the following /) do | urn, |

#end

Then(/^the response should contain the tag:(.*?)$/) do |word|
    tag = JSON.parse(@last_response)['hits'][0]['tags'][0]
	expect(tag).to be == word
end
