require 'spec_helper'

describe '/response endpoint' do
  it 'the response generates the proper keys' do
    get '/response'

    expect(last_response).to be_ok
    
    response = JSON.parse(last_response.body, symbolize_names: true)

    expect(response).to have_key :data
    expect(response[:data]).to have_key :IssLocation
  end
end