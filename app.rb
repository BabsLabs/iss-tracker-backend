require 'sinatra'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }

get '/' do
  "Hello World!"
end

get '/response' do
  response = ResponseService.response
  response.to_json
end