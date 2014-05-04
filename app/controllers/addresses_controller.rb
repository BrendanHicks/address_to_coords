require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates

    if params[:location] == nil

      @address = "Diversey and Southport"

    else

          @address = params[:location]

    end


    @url_safe_address = URI.encode(@address)
            full_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"

        raw_data = open(full_url).read
            parsed_data = JSON.parse(raw_data)
                results = parsed_data["results"]

                       if results[0] != nil


                        @longitude   = results[0]["geometry"]["location"]['lng']
                        @latitude    = results[0]["geometry"]["location"]["lat"]

                       else

                        @longitude = 0.0
                        @latitude = 0.0
                    end

  end
end
