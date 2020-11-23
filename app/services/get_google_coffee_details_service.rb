require 'rest-client'
require 'json'
 
class GetGoogleCoffeeDetailsService
  def initialize(place_id)
    @place_id = place_id
  end

  def call
    place = "place_id=#{@place_id}"
    key = "key=#{Rails.application.credentials.google_secret_key}"
    base_url = "https://maps.googleapis.com/maps/api/place/details/json?#{place}&#{key}"
    response = RestClient.get base_url
    value = JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end