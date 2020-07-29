# International Space Station (ISS) Tracker Backend

## About
The Babslabs ISS Tracker is an application built to track the location of the Internation Space Station across the world as it travels at speeds of over 7.660477 kilometers per second. The information for the ISS is updated every 3 seconds. Click on the ISS marker to display additional information about the ISS. This is the backend service that provides the API data for the Babslabs ISS Tracker app!

[![Build Status](https://travis-ci.com/BabsLabs/iss-tracker-backend.svg?branch=master)](https://travis-ci.com/BabsLabs/iss-tracker-backend)

## Setup
- Clone the repo git clone `https://github.com/BabsLabs/iss-tracker-backend.git`
- Change into project directory
- Install gems with `bundle install`

## Environment Variables
- This project is setup using the [dotenv gem](https://github.com/bkeepers/dotenv) to look for environment variables in a `.env` file in your root directory.

### Required Variables
- `SUPER_SECRET_TOKEN=<YOUR_SUPER_SECRET_TOKEN>`

### Starting Server
- Start server with `ruby app.rb`

### Rerun Server
You can use the `rerun` gem to help reload your Sinatra project without having to hit reload in your browser ovar and over. 
- Use the command `rerun 'ruby app.rb'` to start the rerun server
- Stop the rerun server with `control + c`

## Testing
Testing is done with the Rspec testing library assisted by Webmock.

### Run all tests
Use the command `rspec` to run all tests.

### Run single tests
Use the command `rspec /spec/<path>/<to>/<individual>/<test>` to run a single test.

### Travis-CI
All tests are automatically run with [Travis CI](https://travis-ci.com/) after each pushed branch update.

## Endpoints

### ISS Location
The `/iss` endpoint provides the location information used for tracking the ISS. This information is provided by the [Where is the ISS at? API](https://wheretheiss.at/w/developer).

### Events
The `/events` endpoint provides the natural disaster data - or events - from the [Nasa Earth Observatory Natural Event Tracker API](https://eonet.sci.gsfc.nasa.gov/docs/v2.1).

### Observatories
The `/observatories` endpoint provides the location data for Nasa Ground Station Observatoreis which is provided by the [Nasa Satellite Situation Center API](https://sscweb.gsfc.nasa.gov/WebServices/REST/).

### Authorization Token
All endpoints require an Authorization Token to access them. That token will be passed in as `SUPER_SECRET_TOKEN` in the request headers.

## Technologies

### Languages / Frameworks
- Ruby
- Sinatra

### Libraries
- [Faraday](https://lostisland.github.io/faraday/)

### Testing
- Rspec
- Travis-CI
- Webmock

### APIs
This data in this project comes from the Where's the ISS at? and the NASA Open API Service.

## Requirements
- Ruby 2.7.1 or compatiable version
- Sinatra 2.0.8.1