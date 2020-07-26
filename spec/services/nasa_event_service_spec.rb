require 'spec_helper'

describe NasaEventService do
  it 'fetches the location of Nasa Events from the Nasa API' do
    nasa_event_service = NasaEventService.new
    
    expect(nasa_event_service).to be_a NasaEventService
    
    nasa_event_service_response = NasaEventService.event_locations

    expect(nasa_event_service_response).to have_key :type
    expect(nasa_event_service_response[:type]).to eq 'FeatureCollection'
    expect(nasa_event_service_response).to have_key :features
    expect(nasa_event_service_response[:features]).to be_an Array
    expect(nasa_event_service_response[:features][0]).to be_a Hash
    expect(nasa_event_service_response[:features][0]).to have_key :type
    expect(nasa_event_service_response[:features][0][:type]).to eq 'Feature'
    expect(nasa_event_service_response[:features][0][:properties]).to be_a Hash
    expect(nasa_event_service_response[:features][0][:properties]).to be_a Hash
    expect(nasa_event_service_response[:features][0][:properties]).to have_key :id
  end
end