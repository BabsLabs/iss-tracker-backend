require 'spec_helper'

describe '/response endpoint' do
  it 'the response generates the proper keys' do
    get '/response'

    expect(last_response).to be_ok
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response).to have_key :data
    expect(response[:data]).to have_key :IssLocation
    expect(response[:data][:IssLocation]).to be_a Hash
    expect(response[:data]).to have_key :NasaObservatories
    expect(response[:data][:NasaObservatories]).to be_an Array
    
    expect(response[:data]).not_to have_key "GroundStation"
    expect(response[:data][:NasaObservatories][1]).not_to have_key "GroundStation"
  end
end