require 'faraday'

class NasaEventService

  def self.event_locations
    response = conn.get() do |req|
        req.params['status'] = 'open'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      url = 'https://eonet.sci.gsfc.nasa.gov/api/v3/events/geojson'
      Faraday.new(url, headers: {'Accept' => 'application/json'}) do |f|
        f.adapter Faraday.default_adapter
      end
    end

end
