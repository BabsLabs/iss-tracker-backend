require 'sinatra'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }

get '/' do
  response['Access-Control-Allow-Origin'] = '*'
  "Hello World!"
end

get '/iss' do
  response['Access-Control-Allow-Origin'] = '*'
  response = ResponseService.iss_location_response
  response.to_json
end

get '/events' do
  response['Access-Control-Allow-Origin'] = '*'
  response = ResponseService.events_response
  response.to_json
end

get '/observatories' do
  response['Access-Control-Allow-Origin'] = '*'
  response = ResponseService.observatories_response
  response.to_json
end

