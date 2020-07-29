require 'spec_helper'
require 'net/http'

describe AuthorizationService do
  it 'makes an AuthorizationService' do
    auth_service = AuthorizationService.new
    expect(auth_service).to be_a AuthorizationService
  end

  it 'Authorizes a request' do
    auth_service = AuthorizationService.new
    expect(auth_service).to be_a AuthorizationService
  
    stub_request(:get, "http://www.example.com/").
      with(
        body: "abc",
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Length'=>'3',
        'Http-Super-Secret-Token'=> ENV['SUPER_SECRET_TOKEN'],
        'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "", headers: {})

    uri = URI.parse("http://www.example.com/")
    req = Net::HTTP::Get.new(uri.path)
    req['Content-Length'] = 3
    req['HTTP_SUPER_SECRET_TOKEN'] = ENV['SUPER_SECRET_TOKEN']
    Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req, "abc")
    }

    auth_response = AuthorizationService.authorize(req)

    expect(auth_response).to eq true
  end

  it 'Does not authorize an invalid request' do
    stub_request(:get, "http://www.example.com/").
      with(
        body: "abc",
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Length'=>'3',
        'Http-Super-Secret-Token'=> 'bad token',
        'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "", headers: {})

    uri = URI.parse("http://www.example.com/")
    req = Net::HTTP::Get.new(uri.path)
    req['Content-Length'] = 3
    req['HTTP_SUPER_SECRET_TOKEN'] = 'bad token'
    Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req, "abc")
    }

    auth_response = AuthorizationService.authorize(req)

    expect(auth_response).to eq false
  end
end