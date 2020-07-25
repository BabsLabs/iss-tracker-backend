require 'faraday'

class NasaObservatoryService

  def self.observatory_locations
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new(url: 'https://sscweb.gsfc.nasa.gov/WS/sscr/2/groundStations', headers: {'Accept' => 'application/json'}) do |f|
        f.adapter Faraday.default_adapter
      end
    end

end
