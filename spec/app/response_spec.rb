require 'spec_helper'

describe '/iss endpoint' do
  it 'the response generates the proper iss location container' do
    get '/iss'

    expect(last_response).to be_ok
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response).to have_key :data
    expect(response[:data]).to have_key :IssLocation
    expect(response[:data][:IssLocation]).to be_a Hash
  end

  it 'the response generates the proper events container' do
    get '/events'

    expect(last_response).to be_ok
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response[:data]).to have_key :NasaEvents
    expect(response[:data][:NasaEvents]).to be_an Array
  end

  it 'the response generates the proper observatory container' do
    get '/observatories'

    expect(last_response).to be_ok
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response[:data]).to have_key :NasaObservatories
    expect(response[:data][:NasaObservatories]).to be_an Array
    expect(response[:data]).not_to have_key "GroundStation"
    expect(response[:data][:NasaObservatories][1]).not_to have_key "GroundStation"
  end
end