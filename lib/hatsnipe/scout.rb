require 'faraday'
require 'json'
require 'hatsrank'

module Hatsnipe
  class Scout
    def get_listings
      req = connection.get do |req|
        req.url '/market/recent?country=CA&language=english&currency=1&appid=440'
        req.headers['Content-Type'] = 'application/json'
      end

      json = JSON.parse req.body
      tf2_listings = json["listinginfo"].select { |key, value| value['asset']['appid'] == 440 }

      parser = Hatsrank::ListingParser.new json['listinginfo'], json['assets']
      parser.listings
    end

    private

    def connection
      Faraday.new(:url => 'http://steamcommunity.com/') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
