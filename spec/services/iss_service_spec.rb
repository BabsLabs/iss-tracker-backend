require 'spec_helper'

describe IssService do
  it 'fetches the ISS location from the wheretheiss API' do
    iss_service = IssService.new
    
    expect(iss_service).to be_a IssService
    
    iss_response = IssService.iss_location

    expect(iss_response).to have_key :name
    expect(iss_response).to have_key :id
    expect(iss_response).to have_key :latitude
    expect(iss_response).to have_key :longitude
    expect(iss_response).to have_key :altitude
    expect(iss_response).to have_key :velocity
    expect(iss_response).to have_key :visibility
    expect(iss_response).to have_key :footprint
    expect(iss_response).to have_key :timestamp
    expect(iss_response).to have_key :daynum
    expect(iss_response).to have_key :solar_lat
    expect(iss_response).to have_key :solar_lon
    expect(iss_response).to have_key :units

  end
end