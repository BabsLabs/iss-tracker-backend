class ResponseService
  def self.iss_location_response
    data = Hash.new
    data[:data] = Hash.new
    data[:data][:IssLocation] = current_iss_location
    return data
  end
  
  def self.events_response
    data = Hash.new
    data[:data] = Hash.new
    data[:data][:NasaEvents] = nasa_event_locations
    return data
  end

  def self.observatories_response
    data = Hash.new
    data[:data] = Hash.new
    data[:data][:NasaObservatories] = nasa_observatory_locations
    return data
  end

  private
  
    def self.current_iss_location
      IssService.iss_location
    end

    def self.nasa_observatory_locations
      observatories = NasaObservatoryService.observatory_locations
      observatories[:GroundStation][1]
    end

    def self.nasa_event_locations
      all_events = NasaEventService.event_locations
      return all_events[:features].map do |event|
        event if event[:geometry] != nil
      end
    end

end
