require 'faraday'

class IssService

  def self.iss_location
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new(url: 'https://api.wheretheiss.at/v1/satellites/25544') do |f|
        f.adapter Faraday.default_adapter
      end
    end

end
