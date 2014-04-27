require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "the corner of Foster and Sheridan"
    @url_safe_address = URI.encode(@address)
            full_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"

        raw_data = open(full_url).read
            parsed_data = JSON.parse(raw_data)
                results = parsed_data["results"]
                        @longitude   = results[0]["geometry"]["location"]['lng']
                        @latitude    = results[0]["geometry"]["location"]["lat"]

  end
end
