require 'spec_helper'

describe '/iss endpoint' do
  it 'the response generates the proper iss location container' do
    get '/iss', nil, {'HTTP_SUPER_SECRET_TOKEN' => ENV['SUPER_SECRET_TOKEN']}

    expect(last_response).to be_ok
    expect(last_response.status).to eq 200

    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response).to have_key :data
    expect(response[:data]).to have_key :IssLocation
    expect(response[:data][:IssLocation]).to be_a Hash
  end

  it 'the response generates the proper events container' do
    get '/events', nil, {'HTTP_SUPER_SECRET_TOKEN' => ENV['SUPER_SECRET_TOKEN']}

    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response[:data]).to have_key :NasaEvents
    expect(response[:data][:NasaEvents]).to be_an Array
  end

  it 'the response generates the proper observatory container' do
    get '/observatories', nil, {'HTTP_SUPER_SECRET_TOKEN' => ENV['SUPER_SECRET_TOKEN']}

    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response[:data]).to have_key :NasaObservatories
    expect(response[:data][:NasaObservatories]).to be_an Array
    expect(response[:data]).not_to have_key "GroundStation"
    expect(response[:data][:NasaObservatories][1]).not_to have_key "GroundStation"
  end

  it 'returns a 401 error if no secret token is given' do
    get '/iss', nil, {'HTTP_SUPER_SECRET_TOKEN' => ''}

    expect(last_response.status).to eq 401
    expect(last_response.body).to eq 'Unauthorized - request lacks valid authentication credentials'
  end

  it 'returns a 401 error if bad authorization header is given' do
    get '/iss', nil, {'HTTP_SUPER_SECRET_TOKEN' => 'bad token'}

    expect(last_response).not_to be_ok
    expect(last_response.status).to eq 401
    expect(last_response.body).to eq 'Unauthorized - request lacks valid authentication credentials'
  end

  it 'returns a successful prefight request' do
    options '/observatories', nil, {'HTTP_SUPER_SECRET_TOKEN' => ENV['SUPER_SECRET_TOKEN']}

    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
  end
end