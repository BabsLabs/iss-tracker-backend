class ResponseService

  def self.response
    data = Hash.new
    data[:data] = Hash.new
    data[:data][:IssInfo] = iss_location
    return data
  end
  
  def self.iss_location
    response = IssService.iss_location
  end

end
