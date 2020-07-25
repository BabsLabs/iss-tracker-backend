# International Space Station (ISS) Tracker Backend

## About
The Babslabs ISS Tracker is an application built to track the location of the Internation Space Station across the world as it travels at speeds of over 7.660477 kilometers per second. The information for the ISS is updated every 3 seconds. Click on the ISS marker to display additional information about the ISS. This is the backend service that provides the API data for the Babslabs ISS Tracker app!

## Setup
- Clone the repo git clone `https://github.com/BabsLabs/iss-tracker-backend.git`
- Change into project directory
- Install gems with `bundle install`

### Starting Server
- Start server with `ruby app.rb`

### Rerun Server
You can use the `rerun` gem to help reload your Sinatra project without having to hit reload in your browser ovar and over. 
- Use the command `rerun 'ruby app.rb'` to start the rerun server
- Stop the rerun server with `control + c`

# Testing
Testing is done with the Rspec testing library.

## Run all tests
Use the command `rspec` to run all tests.

## Run single tests
Use the command `rspec /spec/<path>/<to>/<individual>/<test>` to run a single test.

# Technologies

## Languages / Frameworks
- Ruby
- Sinatra

## Libraries
- [Faraday](https://lostisland.github.io/faraday/)

## Testing
- Rspec

## APIs
This data in this project comes from the Where's the ISS at? and the NASA Open API Service.

# Requirements
- Ruby 2.7.1 or compatiable version
- Sinatra 2.0.8.1