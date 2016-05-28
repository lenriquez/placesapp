class Api::V1::PlacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create 
    status = Places.create(params)
  	case status
    when 200
      message = "Your Place has been created succesfully"
  		render json: message, content_type: "application/json"
    when 409
      message = "This places has been already saved"
      render json: message, content_type: "application/json", status: status
  	when 400
  		render nothing: true, status: 400
  	end
  end

  def search 
  	render :json => "{\"Testining_search\":\"Search\"}"
  end
end
