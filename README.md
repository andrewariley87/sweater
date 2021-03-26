## Sweater

The Sweater app recommends clothing based on the temperature.

#### How To Use

1. Create an account with [OpenWeather](https://openweathermap.org/) to get an API key.
2. `git clone git@github.com:andrewariley87/sweater.git`
3. `cp .env.example .env`
4. Add your API Key to `.env`
5. From the command line you can run `ruby app.rb {city},{state_code},{country_code} {recommentdation_file}`
 - example: `ruby app.rb indianapolis,in,usa test.json`
 - `test.json` is included in the repo but you can add your own files to `config`
 
#### Running Tests
1. `ruby -Ilib:test test/lib/weather_request_test.rb`
2. `ruby -Ilib:test test/lib/sweater_test.rb`
3. `ruby -Ilib:test test/app_test.rb`

**TODO: Create rake task to run all tests in one command**

#### Functionality to Add

- Allow users to use both json and CSV
- Validate the input files have the correct attributes
- Allow users to use latitude and longitude coordinates to query by
- Check for conditions(ie. if it is not raining the user more than likely does not want to wear rain coat.)
- Look into the why city querying does not work with just a city and state code. (Issue with Open Weather API)
- Look in to adding more test coverage and adding a rake task for running tests.