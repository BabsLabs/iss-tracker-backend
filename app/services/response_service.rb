class ResponseService

  def self.response
    data = Hash.new
    data[:data] = Hash.new
    data[:data][:IssLocation] = current_iss_location
    data[:data][:NasaObservatories] = nasa_observatory_locations
    return data
  end

  private
  
    def self.current_iss_location
      response = IssService.iss_location
    end

    def self.nasa_observatory_locations
      response = NasaObservatoryService.observatory_locations
      response[:GroundStation][1]
    end

end
