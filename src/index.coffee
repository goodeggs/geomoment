moment = require 'moment-timezone'

moment.day = (day, tzid) ->
  moment.tz day, [moment.day.DASHED_DAY, moment.day.NUMBER_DAY], tzid
moment.day.DASHED_DAY = 'YYYY-MM-DD'
moment.day.NUMBER_DAY = 'YYYYMMDD'

moment.fn.toDay = ->
  @format moment.day.DASHED_DAY

zones =
  eastern: 'America/New_York'
  central: 'America/Chicago'
  pacific: 'America/Los_Angeles'
for zone, tzid of zones
  do (zone, tzid) ->
    moment[zone] = (args...) ->
      args.push tzid
      moment.tz.apply @, args
    moment[zone].tzid = tzid

module.exports = moment
