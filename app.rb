require 'sinatra'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }

get '/' do
  "Hello World!"
end

get '/iss' do
  response = ResponseService.iss_location_response
  response.to_json
end

get '/events' do
  response = ResponseService.events_response
  response.to_json
end

get '/observatories' do
  response = ResponseService.observatories_response
  response.to_json
end