# README

Developed on:
Rails 5.2.2
ruby 2.4.1p111

Setup instructions:
- run rails db:seed

Endpoints:
- http://localhost:8081/api/lines?stop=#{n}
- http://localhost:8081/api/lines?x=#{n}&y=#{n}


Assumptions/Imposed Constraints:
- 2nd column on delay file represents minutes since a line 10 does not exist in  line file
- Minutes delayed will apply to each stop
- Time schedule is daily. Schedule begins on 10:00:00 and ends on 10:15:00
- 24 hour clock
- Requests to API will be in Verspaetung's timezone, ideally server's location
- Access tokens are not needed for this API. All information is public and accessible
- Limited requests to the API

