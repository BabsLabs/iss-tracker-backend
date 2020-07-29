require 'sinatra'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }

set(:method) do |method|
  method = method.to_s.upcase
  condition { request.request_method == method }
end

before :method => :get do
  response['Access-Control-Allow-Origin'] = '*'
  AuthorizationService.authorize(request.env)
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

options '*' do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token, super_secret_token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end