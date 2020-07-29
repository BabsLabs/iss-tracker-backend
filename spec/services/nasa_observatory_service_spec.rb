require 'spec_helper'

WebMock.allow_net_connect! 

describe NasaObservatoryService do
  it 'fetches the location of Nasa Observatories from the Nasa API' do
    nasa_observatory_service = NasaObservatoryService.new
    
    expect(nasa_observatory_service).to be_a NasaObservatoryService
    
    nasa_observatory_service_response = NasaObservatoryService.observatory_locations

    expect(nasa_observatory_service_response).to have_key :GroundStation
    expect(nasa_observatory_service_response[:GroundStation]).to be_an Array
    expect(nasa_observatory_service_response[:GroundStation][0]).to eq("java.util.ArrayList")
    expect(nasa_observatory_service_response[:GroundStation][1]).to be_an Array
    expect(nasa_observatory_service_response[:GroundStation][1][0]).to have_key :Id
    expect(nasa_observatory_service_response[:GroundStation][1][0]).to have_key :Name
    expect(nasa_observatory_service_response[:GroundStation][1][0]).to have_key :Location
    expect(nasa_observatory_service_response[:GroundStation][1][0][:Location]).to be_a Hash
    expect(nasa_observatory_service_response[:GroundStation][1][0][:Location]).to have_key :Latitude
    expect(nasa_observatory_service_response[:GroundStation][1][0][:Location]).to have_key :Longitude

  end
end