require 'elasticsearch'

class Places
	
	# Elastic Search Client
	@@client = Elasticsearch::Client.new log: true

  def self.create_mapping()
    mapping = {
      index: 'authy',
      type: 'places',
      body: {
        properties: {
          name: {
            type: "string"
          },
          location: {
            type: "geo_point"
          },
          raiting: {
            type: "string"
          },
          review: {
            type: "string"
          }
        }
      }
    }
    @@client.indices.put_mapping mapping
  end

	def self.verify_create_parameters(params)
		return params[:name] && params[:location] && params[:rating] && params[:review]
	end

	def self.create(params)
    return 400 unless verify_create_parameters(params)
    return 409 unless verify_by_distance(params[:location]) # Missing verify name
    #save(params)
    return 200
	end

  def self.save(params)
    document = {
      index: 'authy',
      type: 'places',
      body: {
        name: params[:name],
        location: params[:location],
        rating: params[:rating],
        review: params[:review]       
      }
    }
    @@client.index document
  end

  def self.verify_by_distance(location)
    puts search(4.6799123,-74.0475429)
    return true
  end

	def self.search(lat, long, distance="1km")
    @@client.search(
      index: 'authy',
      type: 'region',
      body: {
        query:{
          filtered: {
            filter: {
              geo_distance: {
                distance: distance,
                location:{
                  lat: lat,
                  lon: long
                }
              }
            }
          }
        }
      }
    )
	end
end
